# == Schema Information
#
# Table name: fobs
#
#  id         :integer          not null, primary key
#  key        :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Fob < ActiveRecord::Base
  attr_accessible :key, :user, :user_id

  belongs_to :user

  validates :key , presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }

end
