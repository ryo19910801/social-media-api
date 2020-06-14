json.user do
  json.merge! @user.attributes
  json.avatar_url url_for(@user.avatar) if @user.avatar.attached?
end
