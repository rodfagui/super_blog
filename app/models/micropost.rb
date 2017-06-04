# == Schema Information
#
# Table name: microposts
#
#  id         :integer          not null, primary key
#  content    :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string
#

class Micropost < ApplicationRecord
  belongs_to :user
  has_many :comments
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { minimum: 250 }
end
