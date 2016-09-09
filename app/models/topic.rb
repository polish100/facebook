class Topic < ActiveRecord::Base
  validates :content, presence: true
  validates :title, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
end
