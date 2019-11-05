class User < ApplicationRecord
  has_secure_password
  has_many :crawls
  has_many :crawlers, through: :crawls

end
