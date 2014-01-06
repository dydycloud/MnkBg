class PostsController < ApplicationController
	#before_filter :authenticate_user!

	def index
		@posts = Post.order(created_at: :desc)
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def edit
		@post = Post.find(params[:id])
	end

	def create
	  @post = Post.new(params[:post].permit(:title, :text))
	  if @post.save
	  	redirect_to @post
	  else
	  	render 'new'
	  end
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(params[:post].permit(:title, :text))
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
  		@post.destroy
		redirect_to posts_path
	end


	private
	  def post_params
	    params.require(:post).permit(:title, :text)
	  end
end
