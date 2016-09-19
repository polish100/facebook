


30.times do |n|
  email = Faker::Internet.email
  password = "password"
  name = Faker::Name.name
  uid = Faker::Number.number(10) #=> "1968353479"
  User.create!(email: email,
               password: password,
               password_confirmation: password,
               name: name,
               uid: uid,
               )
end



n = 1
while n <= 30
  title = Faker::Book.title
  content = Faker::StarWars.quote
  Topic.create!(
    title: title,
    content: content,
    user_id: 31
  )
  n += 1
end
