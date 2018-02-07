class Skill < ApplicationRecord
  belongs_to :user
  has_many :endorsements
  has_many :endorsers, through: :endorsements, source: :user

  validates_presence_of :name
  validates_uniqueness_of :name, scope: :user_id
end
