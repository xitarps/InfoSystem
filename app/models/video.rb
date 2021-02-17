class Video < ApplicationRecord
  mount_uploader :file, VideoUploader
  belongs_to :user

  validates :title_pt_br, presence: true
  validates :title_es, presence: true
  validates :description_pt_br, presence: true
  validates :description_es, presence: true
  validates :file, presence: true
end
