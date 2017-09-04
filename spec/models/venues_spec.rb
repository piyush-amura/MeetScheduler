require 'rails_helper'
require 'spec_helper'
RSpec.describe Venue, type: :model do
  describe 'valid venue' do
    describe 'Associations' do
      it { should have_many(:meetings) }
    end
    describe 'Attributes' do
      it { should validate_presence_of(:name) }
      it { should validate_numericality_of(:capacity) }
      it { should validate_presence_of(:address) }
      it { should validate_presence_of(:status) }
    end
  end
  describe 'invalid venue' do
    before(:each) do
      @v = Venue.first
    end

    it 'address is not valid' do
      @v.address = nil
      expect(@v).to_not be_valid
    end

    it 'name is not valid' do
      @v.name = nil
      expect(@v).to_not be_valid
    end

    it 'capacity is not valid' do
      @v.capacity = nil
      expect(@v).to_not be_valid
    end

    it 'status is not valid' do
      @v.status = nil
      expect(@v).to_not be_valid
    end
  end
end
