class Book < ApplicationRecord
  validates :title, presence: true, length: { maximum: 80}
  validates :description, presence: true, length: { maximum: 500}
  validates :cover_url, presence: true, length: { maximum: 120}
end
