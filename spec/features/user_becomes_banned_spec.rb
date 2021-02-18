require 'rails_helper'

feature 'user becomes banned' do
  scenario 'successfully' do
    admin = FactoryBot.create(:user, admin: true)
    user = FactoryBot.create(:user, email:'target@test.com', admin: false)

    login_as admin, scope: :user

    visit users_path

    find("#manage-link-#{user.id}").click

    find('#btn_send_toggle_ban', visible: :all).click

    click_on I18n.t(:logout)

    user.reload

    login_as user, scope: :user

    visit users_path
    
    expect(page).to have_content(I18n.t(:you_re_banned))
    expect(user.ban).to be_truthy
  end
end
