class User < ActiveRecord::Base
  has_many :beverages
  has_secure_password
end 
