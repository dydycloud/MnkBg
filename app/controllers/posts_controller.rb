class PostsController < ApplicationController
	#before_filter :authenticate_user!

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
	  @post = Post.new(post_params)
	  @post.save
	  redirect_to @post
	end

	private
	  def post_params
	    params.require(:post).permit(:title, :text)
	  end
end
