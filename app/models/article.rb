class Article < ApplicationRecord
  belongs_to :user

  validates :title_pt_br, presence: true
  validates :title_es, presence: true
  validates :description_pt_br, presence: true
  validates :description_pt_br, presence: true

  has_many :article_categories
  has_many :categories, through: :article_categories
end
