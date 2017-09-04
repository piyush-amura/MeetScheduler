require 'rails_helper'
require 'spec_helper'
RSpec.describe Meeting, type: :model do
  describe 'valid meetings' do
    before(:each) do
      m = Meeting.new(start_time: Time.now, key_note: 'key note',
                     duration: 30, organiser_id: 1, venue_id: 2, date: Date.today)
      end
    describe 'Associations' do
      it { should have_and_belong_to_many(:members) }
      it { should belong_to(:venue) }
      it { should have_one(:mom) }
    end
    describe 'Attributes' do
      it { should validate_presence_of(:start_time) }
      it { should validate_presence_of(:duration) }
      it { should validate_presence_of(:key_note) }
      it { should validate_presence_of(:date) }
      it { should validate_presence_of(:venue_id) }
      it { should validate_presence_of(:organiser_id) }
    end
  end
  describe 'invalid meetings' do
    before(:each) do
      @m = Meeting.new(start_time: Time.now, key_note: 'key note',
              duration: 30, organiser_id: 1, venue_id: 2, date: Date.today)
    end

    it 'date is not valid' do
      @m.date = nil
      expect(@m).to_not be_valid
    end

    it 'key note is not valid' do
      @m.key_note = nil
      expect(@m).to_not be_valid
    end

    it 'start_time is not valid' do
      @m.start_time = nil
      expect(@m).to_not be_valid
    end

    it 'duration is not valid' do
      @m.duration = nil
      expect(@m).to_not be_valid
    end

    it 'organiser is not valid' do
      @m.organiser_id = nil
      expect(@m).to_not be_valid
    end

    it 'venue is not valid' do
      @m.venue = nil
      expect(@m).to_not be_valid
    end
  end
end
