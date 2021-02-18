require 'rails_helper'

feature 'admin create comment' do
  scenario 'successfully' do
    admin = FactoryBot.create(:user, email: 'admin@test.com', admin: true)

    login_as admin, scope: :user

    visit root_path

    click_on I18n.t(:articles)

    click_on I18n.t(:create_article)

    fill_in I18n.t(:title_pt_br),	with: 'test_title(pt-BR)'
    fill_in I18n.t(:title_es),	with: 'test_title(es)'

    fill_in I18n.t(:description_pt_br),	with: 'lorem(pt-BR)'
    fill_in I18n.t(:description_es),	with: 'lorem(es)'

    click_on I18n.t(:save)

    fill_in I18n.t(:comment),	with: "sometext"

    click_on I18n.t(:save)

    click_on I18n.t(:comments)

    click_on I18n.t(:details)

    click_on I18n.t(:approve)

    expect(page).to have_content('sometext')
  end
end