class PostSub < ApplicationRecord
  validates :post, :sub, presence: true
  validates :post, uniqueness: { scope: :sub }

  belongs_to :post, inverse_of: :post_subs
  belongs_to :sub
end
