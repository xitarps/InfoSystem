class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  has_many :articles, dependent: :nullify
  has_many :videos, dependent: :nullify

  has_many :likes, dependent: :destroy

  has_many :comments, dependent: :nullify
end
