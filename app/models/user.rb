class User < ApplicationRecord
    has_secure_password
    has_one :profile
    # has_many :parks
    validates :username, :password, presence: true 
    validates :username, uniqueness: { message: "Username already exists" }
end
