require 'resolv'

class Comment < ApplicationRecord
  validates :post_id,  presence: true, length: { maximum: 255 }
  validates :name,     presence: true, length: { maximum: 20 }
  validates :public,   inclusion: { in: [true, false] }
  validates :content,  presence: true, length: { maximum: 1200 }
  validates :ipadress, presence: true, format: { with: Resolv::IPv4::Regex }
  validates :admin,    inclusion: { in: [true, false] }
end
