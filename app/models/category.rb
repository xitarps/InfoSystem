class Category < ApplicationRecord
  validates :name, presence: true

  has_many :article_categories, dependent: :nullify
  has_many :articles, through: :article_categories

  has_many :video_categories, dependent: :nullify
  has_many :videos, through: :video_categories
end
