json.array! @posts do |post|
  json.id post.id
  json.user_id post.user_id
  json.text post.text
  json.emotion_id post.emotion_id
  json.stat_1 @stats[post.id][0].to_i
  json.stat_2 @stats[post.id][1].to_i
  json.stat_3 @stats[post.id][2].to_i
  json.stat_4 @stats[post.id][3].to_i
end