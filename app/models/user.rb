class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, presence: true

  has_many  :posts
  # has_many :user_posts
  # has_many :posts, through: :user_posts

  has_many :messages

end
