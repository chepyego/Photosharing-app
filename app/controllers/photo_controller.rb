class PhotoController < ApplicationController
  def index
    @post = Post.all.order("created_at DESC")
  end

  def store
    #upload image to cloudinary
    @value = Cloudinary::Uploader.upload(params[:image])    #create a new post object and save to db
    @post = Post.new({link => @value['secure_url'],:caption => params[:caption]})
    if @post.save 
    #trigger an event with pusher
    #broadcadting posts using pusher
    Pusher.trigger('posts-channel','new-post',{
      link:@post.link,
      caption:@post.caption
    })
    # ['...']
    redirect_to('/')
    # render plain: params[:caption].inspect
  end
end
end
