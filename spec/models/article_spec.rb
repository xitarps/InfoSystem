require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'valid when all attributes are filled' do
    admin = FactoryBot.create(:user, email: 'admin@test.com', admin: true)
    article = admin.articles.new(title_pt_br: 'portuguese',
                                 title_es: 'spanish',
                                 description_pt_br: 'pt-br',
                                 description_es: 'es')
    expect(article.valid?).to be_truthy
  end
  it 'not valid when attributes blank' do
    admin = FactoryBot.create(:user, email: 'admin@test.com', admin: true)
    article = admin.articles.new(title_pt_br: '',
                                 title_es: '',
                                 description_pt_br: '',
                                 description_es: '')
    expect(article.valid?).to be_falsy
    expect(article.errors.count).to equal(3)
  end
end
