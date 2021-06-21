class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

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

  with_options numericality: { other_than: 1 } do
    validates :time_slot_id
    validates :category_id
    validates :situation_id
    validates :prefecture_id
    validates :weather_id
  end

  def self.search(search)
    if search != ''
      Post.where('title LIKE(?)', "%#{search}%")
    else
      Post.includes(:user)
    end
  end
end
