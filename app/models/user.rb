# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  address    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :name, :fobs, :door_keys

  has_many :fobs
  has_many :door_keys

  validates :name, presence: true, length: { maximum: 50}

end
