class User < ApplicationRecord
    has_secure_password
    has_many :habits
    validates :username, uniqueness: { case_sensitive: false}
end
