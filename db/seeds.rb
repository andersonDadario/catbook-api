# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
    3.times do
        user_skills << skills.sample
    end

    user_skills.each do |skill_name|
        user.skills.create({
                name: skill_name
            })
    end
end
