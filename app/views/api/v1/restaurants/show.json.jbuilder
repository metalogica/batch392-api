json.extract! @restaurant, :id, :name, :address # :user -> this will reveal all user info, including their API token

# here we manually extract only the key value pairs that we want from the user record
json.user do
    json.extract! @restaurant.user, :id, :email
end

json.comments @restaurant.comments do |comment|
  json.extract! comment, :id, :content
end