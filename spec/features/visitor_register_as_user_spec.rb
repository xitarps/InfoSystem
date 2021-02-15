require 'rails_helper'

feature 'visitor register' do
  scenario 'successfully' do
    translate_path = 'activerecord.attributes.user'
    visit root_path
    click_on I18n.t(:signup)

    fill_in I18n.t( translate_path + '.email'),	with: "test@test.com" 
    fill_in I18n.t( translate_path + '.password'), with: "test123" 
    fill_in I18n.t( translate_path + '.password_confirmation'),	with: "test123" 

    click_on 'Sign up'

    expect(page).to  have_content(I18n.t('devise.registrations.signed_up'))
  end

  scenario 'successfully(es)' do
    translate_path = 'activerecord.attributes.user'
    visit root_path
    click_on 'Español'
    click_on I18n.t(:signup)

    fill_in I18n.t( translate_path + '.email'),	with: "test@test.com" 
    fill_in I18n.t( translate_path + '.password'), with: "test123" 
    fill_in I18n.t( translate_path + '.password_confirmation'),	with: "test123" 

    click_on 'Sign up'

    expect(page).to  have_content(I18n.t('devise.registrations.signed_up'))
  end

  scenario 'fail (already signed in)' do
    user = User.create(email: 'tester@test.com', password: 'tester123')
    login_as user, scope: :user
    visit root_path
    
    expect(page).not_to  have_content(I18n.t(:signup))
  end
end
