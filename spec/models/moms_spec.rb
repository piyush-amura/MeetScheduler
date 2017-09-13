require 'rails_helper'
require 'spec_helper'
RSpec.describe Mom, type: :model do
  describe 'valid mom' do
    describe 'Associations' do
      it { should have_many(:agendas) }
      it { should belong_to(:meeting) }
    end
    describe 'Attributes' do
      it { should validate_presence_of(:summary) }
      it { should validate_presence_of(:meeting_id) }
    end
  end
  describe 'invalid mom' do
    before(:each) do
      @m = Mom.first
    end

    it 'summary is not valid' do
      @m.summary = nil
      expect(@m).to_not be_valid
    end

    it 'meeting_id is not valid' do
      @m.meeting_id = nil
      expect(@m).to_not be_valid
    end

    describe 'uniqueness' do
      subject { Mom.create(summary: 'something', meeting_id: 1) }
      it { should_not validate_uniqueness_of(:meeting_id) }
    end
  end
end
