class SkillSerializer < ActiveModel::Serializer 
  attributes :id, :name, :user_id, :endorsers, :total_of_endorsers

  def endorsers
    object.endorsers.map do |user|
        {
            id: user.id,
            name: user.name,
            photo_url: user.photo_url
        }
    end
  end

  def total_of_endorsers
    endorsers.length
  end
end
