class User < ApplicationRecord
  has_secure_password

  has_many :movie_lists, dependent: :destroy
end
