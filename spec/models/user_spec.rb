require 'rails_helper'
require 'spec_helper'
RSpec.describe User, type: :model do
  describe 'valid user' do
    describe 'Associations' do
      it { should have_many(:suggestions) }
      it { should have_and_belong_to_many(:meetings) }
    end
    describe 'Attributes' do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:type) }
    end

  end
  describe 'invalid user' do
    before(:each) do
      @m = User.first
    end

    it 'name is not valid' do
      @m.name = nil
      expect(@m).to_not be_valid
    end

    it 'email is not valid' do
      @m.email = nil
      expect(@m).to_not be_valid
    end

    describe 'uniqueness' do
      subject { User.first }
      it { should_not validate_uniqueness_of(:email) }
    end

    it 'organised meetings' do
      id = @m.id
      expect(@m.organised_meetings).to eq Meeting.where(organiser_id: id)
    end

    it 'past_meetings' do
      expect(@m.past_meetings).to eq @m.meetings.where(['date < ?', Date.today])
    end

    it 'upcoming meetings' do
      expect(@m.upcoming_meetings).to eq @m.meetings.where(['date < ?', Date.today])
    end

  end
end
