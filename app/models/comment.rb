class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :reference, polymorphic: true

  validates :description, presence: true
  validates :language, presence: true
end
