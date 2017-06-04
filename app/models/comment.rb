# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  body         :text
#  micropost_id :integer
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Comment < ApplicationRecord
  belongs_to :micropost
  belongs_to :user
end
