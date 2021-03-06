class Post < ApplicationRecord
  validates :title, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :content, presence: true
  belongs_to :user
  has_many :comments
end
