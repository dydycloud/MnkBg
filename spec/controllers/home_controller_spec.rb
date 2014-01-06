require 'spec_helper'

describe HomeController do

  describe "GET 'index'" do
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

end
