class User < ApplicationRecord
  has_secure_password

  validates :nome, presence: true
  validates :email, presence: true, uniqueness: true  
  validates :password, presence: true, length: {minimum:6, maximum:6}
end
