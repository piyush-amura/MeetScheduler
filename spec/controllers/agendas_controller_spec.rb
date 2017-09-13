require 'rails_helper'

RSpec.describe AgendasController do
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
    subject { get :index, params: { mom_id: Mom.first.id } }

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
    subject(:agendas) { Agenda.new }

    it 'is a new agendas' do
      expect(agendas).to be_a_new(Agenda)
    end

    it 'is not a new string' do
      expect(agendas).not_to be_a_new(String)
    end
  end

  describe '#admins create' do
    subject { post :create, params: { agenda: { mom_id: 2, name: 'a', action: "backj" } } }

    it 'redirects to agendas_url' do
      expect(subject).to redirect_to users_admins_meetings_url
    end
  end

  describe '#employee create' do
    before(:each) do
      sign_out @user
      @employee = FactoryGirl.create :employee
      sign_in @employee
    end

    subject { post :create, params: { agenda: { mom_id: 75, name: 'a', action: "backj" } } }

    it 'redirects to agendas_url' do
      expect(subject).to redirect_to users_employees_meetings_url
    end
  end

  describe '#invalid create' do
    subject { post :create, params: { agenda: { mom_id: 2 } } }

    it 'doesn\'t redirects to agendas_url' do
      expect(subject).to_not redirect_to action: :index
    end
  end

  describe '#edit' do
    params = { agenda: { action: 'bjiv' }, id: 1 }
    subject { patch :update, params: params }

    it 'redirects to agendas_url' do
      expect(subject).to redirect_to agendas_path
    end
  end

  describe '#invalid edit' do
    params = { agenda: { action: 'bjiv', mom_id: 'vsa' }, id: 1 }
    subject { patch :update, params: params }

    it 'redirects to agendas_url' do
      expect(subject).to render_template(:edit)
    end
  end

  describe '#destroy' do
    subject { delete :destroy, params: { id: 1 } }
    it 'should return status 302' do
      expect(subject).to redirect_to agendas_path
    end
  end

  describe '#invalid destroy' do
    subject { delete :destroy, params: { id: nil } }
    it 'should not return status 302' do
      expect(response.status).to_not be(302)
    end
  end
end
