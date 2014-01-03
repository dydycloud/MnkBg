class Post < ActiveRecord::Base
	validates :title, :text, presence: true
	validates :title, uniqueness: true
end
