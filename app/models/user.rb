class User < ApplicationRecord
  # This is for the bcrypt gem
  has_secure_password
end
