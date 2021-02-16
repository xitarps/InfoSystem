require 'rails_helper'

feature 'user becomes admin' do
  scenario 'successfully' do
    admin = FactoryBot.create(:user, admin: true)
    user = FactoryBot.create(:user, email:'target@test.com', admin: false)

    login_as admin, scope: :user

    visit users_path
    
    find("#manage-link-#{user.id}").click

    find("#btn_send_toggle_admin", visible: :all).click

    user.reload
    expect(user.admin).to be_truthy
  end
end
