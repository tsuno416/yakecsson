json.array!(@posts) do |post|
  json.extract! post, :id, :contributor, :content, :post_number
  json.url post_url(post, format: :json)
end
