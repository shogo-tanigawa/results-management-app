# coding: utf-8

User.create!(name: "管理者",
             email: "admin@email.com",
             password: "password",
             encrypted_password: "password",
             admin: true)

20.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               encrypted_password: password)
end