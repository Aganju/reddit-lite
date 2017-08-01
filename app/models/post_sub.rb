class PostSub < ApplicationRecord
  validates :post, :sub, presence: true
  validates :post, uniqueness: { scope: :sub }

  belongs_to :post
  belongs_to :sub
end
