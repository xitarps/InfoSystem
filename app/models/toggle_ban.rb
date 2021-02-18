class ToggleBan
  def self.change(user)
    user = User.find(user[:id])
    user.ban = !user.ban
    user.save
  end
end
