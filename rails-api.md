# Syntax on the show page

The example below shows you how to extract values from an associated record. This way we don't render all columns on the record automatically, but can choose which ones the user sees.

```ruby
json.extract! @restaurant, :id, :name, :address # :user -> this will reveal all user info, including their API token

# here we manually extract only the key value pairs that we want from the user record
json.user do
    json.extract! @restaurant.user, :id, :email
end

json.comments @restaurant.comments do |comment|
  json.extract! comment, :id, :content
end
```

To test it out, try running this command in your terminal: 
```sh
curl https://batch-392-api.herokuapp.com/api/v1/restaurants/1 | jq
```