require 'spec_helper'

describe User do
	it "has a valid factory" do
		expect(build(:post)).to be_valid
	end
	it "is invalid without a name" do
		expect(User.new(name: nil)).to have(1).errors_on(:name)
	end
	it "is invalid without a email" do
		expect(User.new(email: nil)).to have(2).errors_on(:email)
	end
	it "is invalid without a password" do
		expect(User.new(password: nil)).to have(2).errors_on(:password)
	end
end
