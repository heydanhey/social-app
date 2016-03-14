json.array! @posts do |post|
  json.id post.id
  json.user_id post.user_id
  json.text post.text
  json.emotion_id post.emotion_id
  json.stats @stats[post.id]
end