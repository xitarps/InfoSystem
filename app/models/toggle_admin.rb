class ToggleAdmin
  def self.change(user)
    user = User.find(user[:id])
    user.admin = !user.admin
    user.save
  end
end
