class Route < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews
  belongs_to :user

  validates :name, presence: true
  validates :style, presence: true
  validates :grade, presence: true
  validates :location, presence: true
  validates :stars, presence: true

  scope :order_by_user, -> {group(:user_id)}

  #validate :not_duplicated

  #scope :order_by_sport -> {group routes by style that contain 'sport'}
  #scope :order_by_boulder -> {group routes by style that contain 'boulder'}
  #scope :order_by_trad -> {group routes by style that contain 'trad'}
  #scope :order_by_alpine -> {group routes by style that contain 'alpine'}

  #scope :order_by_highest_rated -> {order routes from highest star rating to lowest}
  
  #scope :recently_added -> {order routes from recently created to oldest}

  #scope :order_by_creator -> {list of route by the creator}

  #scope search bar feature

  scope :order_by_highest_rated, -> {joins(:reviews).group(:id).order("avg(stars) desc")}
  scope :recently_added, -> {order(created_at: :desc)}

  # def not_duplicated
  #   if Route.find_by(location: location, name: name)
  #     errors.add(:name, 'of this route has already been added to this location')
  #   end
  # end
  # ***How to make this work for only new objects and leave edit objects alone??

end
