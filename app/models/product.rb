# == Schema Information
#
# Table name: products
#
#  id                 :integer          not null, primary key
#  name               :string
#  price              :integer
#  weight             :decimal(10, 2)
#  earliest_delivery  :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  category_id        :integer
#  product_number     :string
#

class Product < ActiveRecord::Base

  validates :name, presence: true
  validates :price, presence: true
  validates :weight, presence: true, numericality: { greater_than: 0 }
  validates :earliest_delivery, presence: true
  validates :category, presence: true
  validates :product_number, presence: true

  has_attached_file :image
  validates_attachment_presence :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  belongs_to :category

end
