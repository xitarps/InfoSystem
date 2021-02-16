require 'rails_helper'

RSpec.describe User, type: :model do
  it 'valid when have email' do
    @user = FactoryBot.build(:user, email: 'user@test.com')

    expect(@user.email).to eq('user@test.com')
    expect(@user.valid?).to eq(true)
  end

  it 'not valid when email is null' do
    @user = FactoryBot.build(:user, email: nil)

    expect(@user.email).not_to eq('usr@test.com')
    expect(@user.valid?).to eq(false)
  end
end
