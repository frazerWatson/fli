class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all.order('created_at DESC').paginate(page: params[:page], per_page: 5)
  end

  def new
    @post = Post.new
  end

  def create 
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    find_post
  end

  def edit
    find_post
  end

  def update
    find_post

    if @post.update(params[:post].permit(:title, :image, :body, :address, :slug))
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    find_post
    @post.destroy

    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :body, :address, :slug, images_file: [])
  end

   def find_post
    @post = Post.friendly.find(params[:id])
   end
end
