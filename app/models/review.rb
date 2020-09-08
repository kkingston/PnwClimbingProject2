class Review < ApplicationRecord
  belongs_to :route
  belongs_to :user

  validates :date, presence: true
  validates :stars, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 6}
  validates :experience, presence: true

  scope :order_reviews_by_user, -> {group(:user_id)}
end
