require 'faker'
puts 'seed started'

Comment.destroy_all
Restaurant.destroy_all
User.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!(:restaurants)

20.times do
  user = User.create(email: Faker::Internet.email, password: 'qwerty')
  10.times do
    resto = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    user_id: user.id
  )

  Comment.create(
    content: Faker::Restaurant.review,
    restaurant_id: resto.id,
    user_id: user.id
  )
  end
end
puts 'seed ended'