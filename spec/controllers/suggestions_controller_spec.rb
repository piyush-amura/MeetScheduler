require 'rails_helper'

RSpec.describe SuggestionsController do
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

  describe 'GET #index with params' do

    subject { get :index, params: { agenda_id: Agenda.first.id } }

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
    subject(:suggestions) { Suggestion.new }

    it 'is a new suggestions' do
      expect(suggestions).to be_a_new(Suggestion)
    end

    it 'is not a new string' do
      expect(suggestions).not_to be_a_new(String)
    end
  end

  describe '#create' do
    subject { post :create, params: { suggestion: { user_id: 1, agenda_id: 1, suggestion: "backj" } } }

    it 'redirects to suggestions_url' do
      expect(subject).to redirect_to suggestions_path(agenda_id: 1)
    end
  end

  describe '#invalid create' do
    subject { post :create, params: { suggestion: { user_id: 1, agenda_id: 1 } } }

    it 'doesn\'t redirects to suggestions_url' do
      expect(subject).to render_template(:new)
    end
  end

  describe '#edit' do
    params = { suggestion: { suggestion: 'cas' }, id: 1 }
    subject { patch :update, params: params }

    it 'redirects to suggestions_url' do
      expect(subject).to redirect_to suggestions_path
    end
  end

  describe '#invalid edit' do
    params = { suggestion: { agenda_id: '3', suggestion: 'cas' }, id: 1 }
    subject { patch :update, params: params }

    it 'redirects to suggestions_url' do
      expect(subject).to render_template(:edit)
    end
  end

  describe '#destroy' do
    subject { delete :destroy, params: { id: 1 } }
    it 'should return status 302' do
      expect(subject).to redirect_to suggestions_path
    end
  end

  describe '#invalid destroy' do
    subject { delete :destroy, params: { id: nil } }
    it 'should not return status 302' do
      expect(response.status).to_not be(302)
    end
  end
 end
