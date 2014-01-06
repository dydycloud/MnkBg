require 'spec_helper'

describe Comment do
  	it "has a valid factory" do
		expect(build(:post)).to be_valid
	end
	it "is invalid without a title" do
		expect(Comment.new(title: nil)).to have(1).errors_on(:title)
	end
	it "is invalid without a commenter" do
		expect(Comment.new(commenter: nil)).to have(1).errors_on(:commenter)
	end
	it "is invalid without a body" do
		expect(Comment.new(body: nil)).to have(1).errors_on(:body)
	end
end
