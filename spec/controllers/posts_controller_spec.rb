require 'spec_helper'

describe PostsController do
	describe 'GET#index' do
		it "returns http success" do
	      get 'index'
	      response.should be_success
	    end

	    it "populates an array of posts starting with the letter" do
			techPost = create(:post, title: "techPost")
			devPost = create(:post, title: "devPost")
			get :index
			expect(assigns(:posts)).to match_array([techPost, devPost])
		end
	end

    describe 'GET#new' do
		it "assigns a new Post to @post" do
			get :new
			expect(assigns(:post)).to be_a_new(Post)
		end

		it "renders the :new template" do
			get 'new'
	      	response.should be_success
		end
	end

	describe 'GET#show' do
		it "assigns the requested post to @post" do
			post = create(:post)
			get :show, id: post
			expect(assigns(:post)).to eq post
		end

		it "renders the :show template" do
			post = create(:post)
			get :show, id: post
			expect(response).to render_template :show
		end
	end

	describe 'GET #edit' do
		it "assigns the requested post to @post" do
			post = create(:post)
			get :edit, id: post
			expect(assigns(:post)).to eq post
		end
		it "renders the :edit template" do
			post = create(:post)
			get :edit, id: post
			expect(response).to render_template :edit
		end
	end

	describe 'POST#create' do
		it "saves the new post in the database" do
			expect{
				post :create, post: attributes_for(:post)
			}.to change(Post, :count).by(1)
		end

		it "redirects to posts#show" do
			post :create, post: attributes_for(:post)
			expect(response).to redirect_to post_path(assigns[:post])
		end
	end

	describe 'PATCH #update' do
		before :each do
			@post = create(:post)
		end
		it "located the requested @post" do
			patch :update, id: @post, post: attributes_for(:post)
			expect(assigns(:post)).to eq(@post)
		end

		it "changes @post's attributes" do
			patch :update, id: @post,
			post: attributes_for(:post,
			title: "First Post", text: "Lorem")
			@post.reload
			expect(@post.title).to eq("First Post")
			expect(@post.text).to eq("Lorem")
		end

		it "redirects to the updated post" do
			patch :update, id: @post, post: attributes_for(:post)
			expect(response).to redirect_to @post
		end
	end

	describe 'DELETE #destroy' do
		before :each do
			@post = create(:post)
		end

		it "deletes the post" do
			expect{
			delete :destroy, id: @post
			}.to change(Post,:count).by(-1)
		end

		it "redirects to contact#index" do
			delete :destroy, id: @post
			expect(response).to redirect_to posts_url
		end
	end
end
