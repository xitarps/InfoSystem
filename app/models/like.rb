class Like < ApplicationRecord
  belongs_to :user
  belongs_to :reference, polymorphic: true

  validates :value, presence: true
  validates :user, presence: true
  validates :reference, presence: true
  validates :user_id, uniqueness: { scope: %i[reference_id reference_type] }
  validates :value, inclusion: 0..4
end
