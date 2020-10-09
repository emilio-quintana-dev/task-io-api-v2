class User < ApplicationRecord
    has_secure_password
    has_many :todos
    validates :name, presence: true
    validates :name, length: { minimum: 5, maximum: 50 }
    validates :email, presence: true, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, length: { minimum: 6 }
end
