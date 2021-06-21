class User < ActiveRecord::Base
  validates :first_name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: true

  has_secure_password
  has_many :todos
end
