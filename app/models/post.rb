class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :time_slot
  belongs_to :category
  belongs_to :situation
  belongs_to :prefecture
  belongs_to :weather

  with_options presence: true do
    validates :title
    validates :text
    validates :image
  end
end
