# json.jbuilder

# @restaurants.map do | restaurant|
#     json.extract! restaurant, :id, :name  
# end

json.array! @restaurants do |restaurant|
    json.extract! restaurant, :id, :name, :address
end