class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy

  before_save(:titleize_product)

  validates :name, presence: true
  validates :country_of_origin, presence: true
  validates :cost, presence: true

  scope :three_most_recent, -> { order(created_at: :desc).limit(3)}

  scope :most_reviews, -> {(
  select("products.id, products.name, products.cost, count(reviews.id) as reviews_count")
  .joins(:reviews)
  .group("reviews.id")
  .order("reviews_count DESC")
  .limit(1)
  )}

  private
  def titleize_product
    self.name = self.name.titleize
  end

end
