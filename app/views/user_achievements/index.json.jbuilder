json.array!(@user_achievements) do |user_achievement|
  json.extract! user_achievement, :id
  json.url user_achievement_url(user_achievement, format: :json)
end
