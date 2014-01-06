require 'spec_helper'

describe CommentsController do
	describe 'POST#create' do
		it "saves the new comment in the database" do
			@post = create(:post)
			expect{
				post :create, post_id: @post.id, comment: attributes_for(:comment)
			}.to change(Comment, :count).by(1)
		end

		it "redirects to posts#show" do
			@post = create(:post)
			post :create, post_id: @post.id, comment: attributes_for(:comment)
			expect(response).to redirect_to post_path(@post)
		end
	end
end
