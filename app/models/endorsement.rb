class HonestEndorsementValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if record.skill.user_id == record.user_id
      record.errors[attribute] << (options[:message] || "is trying to endorse himself")
    end
  end
end

class Endorsement < ApplicationRecord
  belongs_to :skill
  belongs_to :user

  validates_presence_of :user_id, :skill_id
  validates_uniqueness_of :user_id, scope: :skill_id

  # Prevent user from endorsing himself
  validates :user_id, honest_endorsement: true
end
