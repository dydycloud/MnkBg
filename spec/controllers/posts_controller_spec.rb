require 'spec_helper'

describe PostsController do
	describe 'GET#index' do
		it "returns http success" do
	      get 'index'
	      response.should be_success
	    end

	    it "populates an array of contacts starting with the letter" do
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
end
