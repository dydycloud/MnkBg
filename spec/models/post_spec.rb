require 'spec_helper'

describe Post do
  	it "has a valid factory" do
		expect(build(:post)).to be_valid
	end
	it "is invalid without a title" do
		expect(Post.new(title: nil)).to have(1).errors_on(:title)
	end
	it "is invalid without a text" do
		expect(Post.new(text: nil)).to have(1).errors_on(:text)
	end
	it "is invalid with a duplicate title" do
		Post.create(title: 'Post1', text:'lorem')
		post = Post.new(title: 'Post1', text:'lorem')
		expect(post).to have(1).errors_on(:title)
	end
end
