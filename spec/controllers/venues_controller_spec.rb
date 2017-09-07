require 'rails_helper'

RSpec.describe VenuesController do
  before(:each) do
    @user = FactoryGirl.create :user
    sign_in @user
  end
  describe 'GET #index' do
    subject { get :index }

    it 'renders the index template' do
      expect(subject).to render_template(:index)
    end

    it 'does not render a different template' do
      expect(subject).to_not render_template(:new)
    end
  end

  describe 'GET #new' do
    subject { get :new }

    it 'renders the index template' do
      expect(subject).to render_template(:new)
    end

    it 'does not render a different template' do
      expect(subject).to_not render_template(:index)
    end
  end

  context 'when initialized' do
    subject(:venues) { Venue.new }

    it 'is a new venues' do
      expect(venues).to be_a_new(Venue)
    end

    it 'is not a new string' do
      expect(venues).not_to be_a_new(String)
    end
  end

  describe '#create' do
    subject { post :create, params: { venue: { name: 'F', address: 'p' } } }

    it 'redirects to venues_url' do
      expect(subject).to redirect_to action: :index
    end
  end

  describe '#invalid create' do
    subject { post :create, params: { venue: { address: 'p' } } }

    it 'doesn\'t redirects to venues_url' do
      expect(subject).to_not redirect_to action: :index
    end
  end

  describe '#edit' do
    params = { venue: { name: 'Foo', address: 'pune' }, id: 5 }
    subject { patch :update, params: params }

    it 'redirects to venues_url' do
      expect(subject).to redirect_to action: :index
    end
  end

  describe '#invalid edit' do
    params = { id: 5 ,venue: { name: 'Foo', address: 'pune', capacity: 'cv' }}
    subject { patch :update, params: params }

    it 'redirects to venues_url' do
      expect(subject).to render_template(:edit)
    end
  end

  describe '#destroy' do
    subject { delete :destroy, params: { id: 5 } }
    it 'should return status 302' do
      expect(subject).to redirect_to action: :index
    end
  end

  describe '#invalid destroy' do
    subject { delete :destroy, params: { id: nil } }
    it 'should not return status 302' do
      expect(response.status).to_not be(302)
    end
  end
end
