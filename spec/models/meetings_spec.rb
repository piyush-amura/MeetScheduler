require 'rails_helper'

RSpec.describe Meeting, type: :model do
  it 'meeting belongs to a venue' do
    m = Meeting.reflect_on_association(:venue)
    expect(m.macro).to eq(:belongs_to)
  end

  it 'meeting belongs to a organiser' do
    m = Meeting.reflect_on_association(:members)
    expect(m.macro).to eq(:has_and_belongs_to_many)
  end
end