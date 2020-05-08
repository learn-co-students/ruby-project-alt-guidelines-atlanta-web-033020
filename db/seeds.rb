Student.destroy_all
Story.destroy_all
Review.destroy_all

abe = Student.create(name: "Abraham")
bee = Student.create(name: "Beatrice")
cc = Student.create(name: "Cecelia")
d = Student.create(name: "DeAnna")
elise = Student.create(name: "Elise")

puts "All students created."

malala = Story.create(title: "I Am Malala", author: "Malala Yousafzai", genre: "biography")
chains = Story.create(title: "Chains", author: "L.H. Anderson", genre: "historical fiction")
web = Story.create(title: "Charlotte's Web", author: "E.B. White", genre: "fantasy")


puts "All stories created."

#??? Why doesn't -- student: elise -- cause an issue with the migration table Reviews student_id requirement???#
rev1 = Review.create(student: elise, story: malala, comment: "Riveting story")
rev2 = Review.create(student: cc, story: malala, comment: "Very inspirational")
rev3 = Review.create(student: bee, story: chains, comment: "Courageous characters")
rev4 = Review.create(student: elise, story: web, comment: "Gut wrenching")
rev5 = Review.create(student: d, story: chains, comment: "Chains is a masterpiece")
rev6 = Review.create(student: abe, story: web, comment: "What, no freakin' bacon?")
rev7 = Review.create(student: cc, story: web, comment: "Spiders freak me out!")
rev8 = Review.create(student: elise, story: chains, comment: "Wow! The sibling bond was everything!")
rev9 = Review.create(student: bee, story: malala, comment: "A gentle spirit in a brutal world")
rev10 = Review.create(student: d, story: web, comment: "The spider was the real miracle!")



puts "All reviews created."



#### Use rake tasks to automate creating data with faker ####
#### Five to ten instances of each model, as well as the corresponding relationships should be enough. You can always add more later. ####

# Faker::Name.name # returns a random name
# Faker::Address.city # returns a random city
# Faker::IDNumber.valid # returns a random valid Social Security Number

# User.create(name: Faker::Name.name)
# Restaurant.create(name: Faker::Company.name)
# Review.create(user_id: User.all.sample.id, restaurant_id: Restaurant.all.sample.id, content: Faker::Hacker.say_something_smart)


