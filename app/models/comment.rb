class Comment < ApplicationRecord
  validates :post_id, presence: true, length: { maximum: 255 }
  validates :name,    presence: true, length: { maximum: 20 }
  validates :content, presence: true, length: { maximum: 1200 }
end
