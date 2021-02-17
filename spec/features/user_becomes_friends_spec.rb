require 'rails_helper'

feature 'users becomes friends' do
  scenario 'successfully' do
    user = FactoryBot.create(:user, email: 'user@test.com', admin: false)
    friend = FactoryBot.create(:user, email:'friend@test.com', admin: false)

    login_as user, scope: :user

    visit users_path
    
    find('#user_friend_ids_2').click

    click_on I18n.t(:add_friends)

    within 'ul' do
      expect(page).to have_content('friend@test.com')
    end
    
  end
end
