class User < ApplicationRecord
    has_secure_password
    has_many :skills, dependent: :destroy
    has_many :endorsements, dependent: :destroy
    has_many :endorsed_skills, through: :endorsements, source: :skill
end
