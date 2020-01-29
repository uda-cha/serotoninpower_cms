require 'resolv'

class Comment < ApplicationRecord
  validates :post_id,  presence: true, length: { maximum: 255 }
  validates :name,     presence: true, length: { maximum: 20 }
  validates :public,   presence: true
  validates :content,  presence: true, length: { maximum: 1200 }
  validates :ipadress, presence: true, format: { with: Resolv::IPv4::Regex }
  validates :admin,    presence: true
end
