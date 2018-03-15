class Beverage < ActiveRecord::Base
  validates :name, :presence => true
  validates :category, :presence => true
  validates :rating, :presence => true 

  belongs_to :user
end
