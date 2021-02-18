require 'rails_helper'

feature 'admin manage categories' do
  scenario 'create successfully' do
    admin = FactoryBot.create(:user, email: 'admin@test.com', admin: true)

    login_as admin, scope: :user

    visit root_path

    click_on I18n.t(:tags)

    click_on I18n.t(:new_category)

    fill_in I18n.t(:tag),	with: 'my_tag_test'

    click_on I18n.t(:save)

    expect(page).to have_content('#my_tag_test')
  end
  scenario 'set category to article successfully' do
    admin = FactoryBot.create(:user, email: 'admin@test.com', admin: true)

    login_as admin, scope: :user

    visit new_category_path

    fill_in I18n.t(:tag),	with: 'my_tag_test'

    click_on I18n.t(:save)

    visit root_path

    click_on I18n.t(:articles)

    click_on I18n.t(:create_article)

    fill_in I18n.t(:title_pt_br),	with: 'test_title(pt-BR)'
    fill_in I18n.t(:title_es),	with: 'test_title(es)'

    fill_in I18n.t(:description_pt_br),	with: 'lorem(pt-BR)'
    fill_in I18n.t(:description_es),	with: 'lorem(es)'

    find(:option, 'my_tag_test').select_option

    click_on I18n.t(:save)

    expect(page).to have_content('#my_tag_test')
  end
end
