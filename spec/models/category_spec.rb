require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'not valid when name is null' do
    @category = Category.new
    @category.valid?

    expect(@category.errors.count).to equal(1)
    expect(@category.valid?).to eq(false)
  end
end
