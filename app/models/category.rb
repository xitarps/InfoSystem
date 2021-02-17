class Category < ApplicationRecord
  validates :name, presence: true

  has_many :article_categories
  has_many :articles, through: :article_categories

  has_many :video_categories
  has_many :videos, through: :video_categories
end
