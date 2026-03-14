class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  has_many :reviews, dependent: :destroy 

  validates :name, presence: true, uniqueness: true
  validates :image_url, format: { with: URI::regexp(%w[http https]),
    allow_blank: true, message: "must be a valid URL" }
end
