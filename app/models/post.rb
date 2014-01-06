class Post < ActiveRecord::Base
	has_many :comments
	validates :title, :text, presence: true
	validates :title, uniqueness: true
end
