class Comment < ActiveRecord::Base
  belongs_to :post
  validates :title, :commenter,:body, presence: true
end
