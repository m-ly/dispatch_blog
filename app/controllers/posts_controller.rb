class PostsController < ApplicationController
  #http_basic_authenticate_with name: 'Matt', password: 'secret', except: [:index, :show]

  def new
    @post = Post.new
  end 

  def create
    @post = Post.new(post_params)
 
    if @post.save
      redirect_to @post
    else
      render 'new', status: :unprocessable_entity
    end 
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update 
    @post = Post.find(params[:id])
    
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity 
    end 
  end 

  def index 
    @posts = Post.all
  end 

  def show
    @post = Post.find(params[:id])
  end

  def destroy 
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path, status: :see_other
  end 

  private

  def post_params
    params.require(:post).permit(:title, :text, :status )
  end 
end
