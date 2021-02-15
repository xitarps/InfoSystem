require 'rails_helper'

feature 'user visit homepage' do
  scenario 'successfully(default)' do
    visit root_path
    expect(page).to  have_content(I18n.t('home.index.title'))
  end

  scenario 'successfully(pt-BR)' do
    visit root_path
    click_on 'Português'
    expect(page).to  have_content('Bem Vindo')
  end

  scenario 'successfully(es)' do
    visit root_path
    click_on 'Español'
    expect(page).to  have_content('Bien Venido')
  end
end
