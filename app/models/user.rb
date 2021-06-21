class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, AvatarUploader

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follower
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :user

  validates :nickname, presence: true

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i, message: 'Include both letters and numbers' }

  def liked_by?(post_id)
    likes.where(post_id: post_id).exists?
  end

  def following?(user)
    followings.include?(user)
  end

  def follow(user_id)
    relationships.create(follower: user_id)
  end

  def unfollow(relationship_id)
    relationships.find(relationship_id).destroy!
  end

  def self.search(search)
    if search != ''
      User.where('nickname LIKE(?)', "%#{search}%")
    else
      User.all
    end
  end
end
