class User < ActiveRecord::Base
  validates :email, :presence => true, :uniqueness => true
  validates :username, :presence => true, :uniqueness => true
  validates :password, :presence => true

  has_many :beverages
  has_secure_password
end
