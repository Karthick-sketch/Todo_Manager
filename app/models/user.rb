class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :first_name, length: { minimum: 2 }
  validates :email, presence: true

  has_secure_password
  has_many :todos
end
