json.user do
  json.merge! current_user.attributes
  json.avatar_url url_for(current_user.avatar) if current_user.avatar.attached?
end
