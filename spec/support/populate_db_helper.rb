# - Creates 10 users
# - Add 2 skills for each user

def populate_db

    skills = [ "Jump", "Meow", "Milk Analysis", "Play", "Rat tracking",
               "Sway Humans", "World Domination", "Dog tricking", "Climbing" ]

    (1..10).each do |number|
        user = User.create({
            name: "Cat#{number}",
            email: "cat#{number}@ho.me",
            photo_url: "/assets/images/cat#{number}.jpg",
            password: "letmein"
        })

        unless user.persisted?
            puts "User not saved: #{user.errors.messages}"
            exit
        end

        user_skills = []
        user_skills << skills.first
        user_skills << skills.last

        user_skills.each do |skill_name|
            user.skills.create({
                    name: skill_name
                })
        end
    end

    # Endorse skills for Skill 1
    Endorsement.create({
            skill_id: 1,
            user_id: 2
        })

    Endorsement.create({
            skill_id: 1,
            user_id: 3
        })

end