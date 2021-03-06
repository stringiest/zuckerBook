class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_secure_password
  validates :username, uniqueness: true
  validates :email, uniqueness: { message: 'already registered' }
  has_one_attached :avatar

  def email=(value)
    value = value.strip.downcase
    write_attribute :email, value
  end
end
