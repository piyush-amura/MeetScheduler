require 'rails_helper'
require 'spec_helper'
RSpec.describe Suggestion, type: :model do
  describe 'valid suggestion' do
    describe 'Associations' do
      it { should belong_to(:user) }
      it { should belong_to(:agenda) }
    end
    describe 'Attributes' do
      it { should validate_presence_of(:agenda_id) }
      it { should validate_presence_of(:user_id) }
      it { should validate_presence_of(:suggestion) }
    end
  end
  describe 'invalid suggestion' do
    before(:each) do
      @m = Suggestion.first
    end

    it 'suggestion is not valid' do
      @m.suggestion = nil
      expect(@m).to_not be_valid
    end

    it 'agenda_id is not valid' do
      @m.agenda_id = nil
      expect(@m).to_not be_valid
    end

    it 'user_id is not valid' do
      @m.user_id = nil
      expect(@m).to_not be_valid
    end
  end
end
