if @see_post

  json.array! @posts do |post|
    json.id post.id
    json.user_id post.user_id
    json.text post.text
    json.emotion_id post.emotion_id
  end

else
  
  json.array! @weactions do |weaction|
    if weaction.post
      json.id weaction.id
      json.text weaction.post.text
      json.emotion_id weaction.post.emotion_id
    end
  end

end