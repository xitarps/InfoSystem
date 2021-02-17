require 'rails_helper'

RSpec.describe Video, type: :model do
  it 'not valid when title is null' do
    @video = Video.new
    @video.valid?

    expect(@video.errors.count).to equal(6)
    expect(@video.valid?).to eq(false)
  end
end
