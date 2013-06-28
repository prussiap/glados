# == Schema Information

# Table name: doors
#
#  id         :integer          not null, primary key
#  doorkey_id :integer
#  doorname   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Door < ActiveRecord::Base
  attr_accessible  :doorname, :door_keys, :doorkey_id 
  has_many :door_keys


  validates :doorname, presence: true, length: { maximum: 30}, uniqueness: { case_sensitive: false }

  def validate_fob(fob)
    (fob.user.door_keys & door_keys).count > 0
  end
end
