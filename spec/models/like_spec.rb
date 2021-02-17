require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'not valid when attributes blank' do
    like = FactoryBot.build(:like,
                            reference_id: nil,
                            reference_type: '',
                            user_id: nil,
                            value: nil)
    expect(like.valid?).to be_falsy
    expect(like.errors.count).to equal(6)
  end
end
