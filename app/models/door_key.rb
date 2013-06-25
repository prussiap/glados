# == Schema Information
#
# Table name: door_keys
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  door_id    :integer
#

class DoorKey < ActiveRecord::Base
   attr_accessible :user_id, :door_id, :user, :door
   belongs_to :door
   belongs_to :user

   validates :user_id, presence: true
   validates :door_id, presence: true

end
