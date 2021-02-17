require 'rails_helper'

feature 'admin manage article' do
  scenario 'create successfully' do
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

    expect(page).to have_content('test_title')
    expect(page).to have_content('lorem')
  end

  scenario 'edit successfully' do
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

    visit articles_path

    click_on I18n.t(:edit)

    fill_in I18n.t(:title_pt_br),	with: 'new_test(pt-BR)'
    fill_in I18n.t(:title_es),	with: 'new_test(es)'

    click_on I18n.t(:save)

    expect(page).not_to have_content('test_title')
    expect(page).to have_content('new_test')
  end

  scenario 'delete successfully' do
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

    visit articles_path

    click_on I18n.t(:delete)

    expect(page).not_to have_content('test_title')
    expect(page).not_to have_content('lorem')
  end
end
