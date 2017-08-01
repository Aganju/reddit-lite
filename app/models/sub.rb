# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  title        :string           not null
#  description  :text
#  moderator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Sub < ApplicationRecord
  validates :title, :moderator_id, presence: true
  validates :title, uniqueness: { scope: :moderator_id}

  has_many :post_subs,
    dependent: :destroy

  has_many :posts,
    through: :post_subs,
    source: :post,
    dependent: :destroy

  belongs_to :moderator,
    class_name: :User
end
