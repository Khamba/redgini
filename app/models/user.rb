# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  name          :string
#  email         :string
#  provider      :string
#  mobile_number :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  uid           :string
#  otp           :string
#

class User < ActiveRecord::Base
  has_one :address
  has_many :orders
  def self.from_omniauth(auth_hash)
    user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
    user.name = auth_hash['info']['name']
    user.email = auth_hash['info']['email']
    user.save!
    return user
  end
end
