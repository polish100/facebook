
#   email = Faker::Internet.email
#   password = "password"
#   name = Faker::Name.name

# 100.times do |n|
#   User.create!(email: email,
#                password: password,
#                password_confirmation: password,
#                name: name,
#                )
# end



n = 203
while n <= 302
  title = Faker::Book.title
  content = Faker::StarWars.quote
  Topic.create!(
    title: title,
    content: content,
    user_id: n
  )
  n += 1
end
