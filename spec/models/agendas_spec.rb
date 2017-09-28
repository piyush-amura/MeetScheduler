require 'rails_helper'
require 'spec_helper'
RSpec.describe Agenda, type: :model do
  describe 'valid agenda' do
    describe 'Associations' do
      it { should belong_to(:mom) }
      it { should have_many(:suggestions) }
    end
    describe 'Attributes' do
      it { should validate_presence_of(:name) }
      it { should validate_numericality_of(:allocated_time) }
      it { should validate_presence_of(:action) }
      it { should validate_presence_of(:status) }
      it { should validate_presence_of(:mom_id) }
    end
  end
  describe 'invalid agenda' do
    before(:each) do
      @a = Agenda.first
    end

    it 'mom is not valid' do
      @a.mom = nil
      expect(@a).to_not be_valid
    end

    it 'name is not valid' do
      @a.name = nil
      expect(@a).to_not be_valid
    end

    it 'action is not valid' do
      @a.action = nil
      expect(@a).to_not be_valid
    end

    it 'status is not valid' do
      @a.status = nil
      expect(@a).to_not be_valid
    end

    it 'allocated_time is not valid' do
      @a.allocated_time = nil
      expect(@a).to_not be_valid
    end
  end
end
