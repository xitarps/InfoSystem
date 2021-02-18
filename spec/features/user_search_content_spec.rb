require 'rails_helper'

feature 'user search content' do
  scenario 'successfully' do
    admin = FactoryBot.create(:user, email: 'admin@test.com', admin: true)
    user = FactoryBot.create(:user, email:'target@test.com', admin: false)

    login_as admin, scope: :user

    visit root_path

    click_on I18n.t(:articles)

    click_on I18n.t(:create_article)

    fill_in I18n.t(:title_pt_br),	with: 'test_title(pt-BR)'
    fill_in I18n.t(:title_es),	with: 'test_title(es)'

    fill_in I18n.t(:description_pt_br),	with: 'lorem(pt-BR)'
    fill_in I18n.t(:description_es),	with: 'lorem(es)'

    click_on I18n.t(:save)

    click_on I18n.t(:logout)

    login_as user, scope: :user

    visit root_path

    find("##{I18n.t(:query_field)}", visible: :all).set('lorem')
    
    find("##{I18n.t(:query_submit)}", visible: :all).click

    expect(page).to have_content('test_title')

  end
  scenario 'failure - blank' do
    admin = FactoryBot.create(:user, email: 'admin@test.com', admin: true)
    user = FactoryBot.create(:user, email:'target@test.com', admin: false)

    login_as admin, scope: :user

    visit root_path

    click_on I18n.t(:articles)

    click_on I18n.t(:create_article)

    fill_in I18n.t(:title_pt_br),	with: 'test_title(pt-BR)'
    fill_in I18n.t(:title_es),	with: 'test_title(es)'

    fill_in I18n.t(:description_pt_br),	with: 'lorem(pt-BR)'
    fill_in I18n.t(:description_es),	with: 'lorem(es)'

    click_on I18n.t(:save)

    click_on I18n.t(:logout)

    login_as user, scope: :user

    visit root_path

    find("##{I18n.t(:query_field)}", visible: :all).set('')
    
    find("##{I18n.t(:query_submit)}", visible: :all).click

    expect(page).not_to have_content('test_title')
    expect(page).to have_content(I18n.t(:no_results))
  end
end
