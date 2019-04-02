class PhotoController < ApplicationController
  def index
    @post = Post.all
  end

  def store
    render plain: params[:caption].inspect
  end
end
