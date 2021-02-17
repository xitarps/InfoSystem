feature 'Visitor register movie' do
  scenario 'successfully' do
    admin = FactoryBot.create(:user, admin: true)
    login_as admin, scope: :user

    visit root_path

    click_on I18n.t(:videos)

    click_on I18n.t(:add_video)

    fill_in I18n.t(:title_pt_br),	with: 'test_title(pt-BR)'
    fill_in I18n.t(:title_es),	with: 'test_title(es)'

    fill_in I18n.t(:description_pt_br),	with: 'lorem(pt-BR)'
    fill_in I18n.t(:description_es),	with: 'lorem(es)'

    attach_file I18n.t(:file), Rails.root.join('spec', 'support', 'rabbit.mp4')

    click_on I18n.t(:save)

    expect(page).to have_css('video[src*="rabbit.mp4"]')
  end
end
