# == Schema Information
#
# Table name: addresses
#
#  id         :integer          not null, primary key
#  name       :string
#  line_1     :string
#  line_2     :string
#  area       :string
#  city       :string
#  state      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Address < ActiveRecord::Base
  validates :name, presence: true
  validates :line_1, presence: true
  validates :line_2, presence: true
  validates :area, presence: true
  belongs_to :user
end
