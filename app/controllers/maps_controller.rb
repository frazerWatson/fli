class MapsController < ApplicationController

  def show
    @posts = Post.find(params[:post_id])
  end

end
