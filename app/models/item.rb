class Item < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "introduction", "name", "price", "updated_at"]
  end

  has_one_attached :image
end
