class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  before_save(:titleize_product)
  validates :name, presence: true
  validates :country_of_origin, presence: true
  validates :cost, presence: true

  private
  def titleize_product
    self.name = self.name.titleize
  end
  
end
