class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
  	# display all the posts in the desending order.
  	@posts = Post.all.order("created_at DESC")
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
  	# @post = Post.find(params[:id])
  end

  def edit
  	# @post = Post.find(params[:id])
  end

  def update
  	# @post = Post.find(params[:id])
  	if @post.update(post_params) # post_params is method name 
  		redirect_to @post
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@post.destroy
  	redirect_to root_path
  end

    private

  def find_post
  	@post = Post.find(params[:id]) # is params predefined? check it out
  end

  def post_params
  	params.require(:post).permit(:title, :body)
  end
end
