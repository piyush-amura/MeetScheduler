require 'rails_helper'

RSpec.describe Users::Admins::MeetingsController, type: :controller do
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
    subject(:meetings) { User::Admin::Meeting.new }

    it 'is a new meetings' do
      expect(meetings).to be_a_new(User::Admin::Meeting)
    end

    it 'is not a new string' do
      expect(meetings).not_to be_a_new(String)
    end
  end

  context 'when saved' do
    subject(:meetings) do
      User::Admin::Meeting.create(date: '2017-09-07',
                                  start_time: '2000-01-01 10:00:00',
                                  key_note: 'first meeting',
                                  duration: 15.0,
                                  organiser_id: User.first,
                                  venue_id: 5)
    end

    it 'it is a new meetings' do
      expect(meetings).to be_a_new(User::Admin::Meeting)
    end

    it 'is not a new string' do
      expect(meetings).not_to be_a_new(String)
    end
  end

  describe '#create' do
    subject { post :create, params: { meeting: { date: '2017-09-07',
                                                 start_time: '2000-01-01 10:00:00',
                                                 key_note: 'first meeting',
                                                 duration: 15.0,
                                                 organiser_id: User.first,
                                                 venue_id: 5
                                                } } }

    it 'redirects to meetings_url' do
      expect(subject).to redirect_to action: :index
    end
  end

  describe '#invalid create' do
    subject { post :create, 
              params: { meeting: { date: '2017-09-07',
                                   start_time: '2000-01-01 10:00:00',
                                   key_note: 'first meeting',
                                   duration: 15.0,
                                   organiser_id: User::Admin::Meeting.first,
                                   venue_id: 5
                                  } } }

    it 'doesn\'t redirects to meetings_url' do
      expect(response.status).to_not redirect_to action: :index
    end
  end

  describe '#edit' do
    params = { meeting: { date: '2017-09-07',
                          start_time: '2000-01-01 10:00:00',
                          key_note: 'first meeting',
                          duration: 15.0,
                          venue_id: 5 },
               id: User::Admin::Meeting.first
    }
    subject { patch :update, params: params }

    it 'redirects to meetings_url' do
      expect(subject).to redirect_to action: :index
    end
  end

  describe '#invalid edit' do
    params = { meeting: { date: '2017-09-07',
                          start_time: '2000-01-01 10:00:00',
                          key_note: 'first meeting',
                          duration: 'gj',
                          venue_id: 5 },
               id: User::Admin::Meeting.first
    }
    subject { patch :update, params: params }

    it 'redirects to meetings_url' do
      expect(subject).to render_template(:edit)
    end
  end

  describe '#destroy' do
    subject { delete :destroy, params: { id: User::Admin::Meeting.last } }
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

  describe '#add member' do
    subject { get :add_members, params: { id: Meeting.first.id } }
    it 'should render add_members template' do
      expect(subject).to render_template(:add_members)
    end
  end

  describe '#add member post request' do
    subject { post :add_members, params: { meeting_id: Meeting.first.id,
                                          selected: { '13' => '0'},
                                          id:'74'
                                           } }
    it 'should return status 302' do
      expect(subject).to redirect_to(users_admins_meetings_url)
    end
  end

  describe '#remove member' do
    subject { get :remove_members, params: { id: Meeting.first.id } }
    it 'should render remove_members template' do
      expect(subject).to render_template(:remove_members)
    end
  end

  describe '#remove member post request' do
    subject { post :remove_members, params: { meeting_id: Meeting.first.id,
                                          selected: { '13' => '0'},
                                          id:'74'
                                           } }
    it 'should return status 302' do
      expect(subject).to redirect_to(users_admins_meetings_url)
    end
  end

end

RSpec.describe Users::Employees::MeetingsController, type: :controller do
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
    subject(:meetings) { User::Employee::Meeting.new }

    it 'is a new meetings' do
      expect(meetings).to be_a_new(User::Employee::Meeting)
    end

    it 'is not a new string' do
      expect(meetings).not_to be_a_new(String)
    end
  end

  context 'when saved' do
    subject(:meetings) do
      User::Employee::Meeting.create(date: '2017-09-07',
                                  start_time: '2000-01-01 10:00:00',
                                  key_note: 'first meeting',
                                  duration: 15.0,
                                  organiser_id: User.first,
                                  venue_id: 5)
    end

    it 'it is a new meetings' do
      expect(meetings).to be_a_new(User::Employee::Meeting)
    end

    it 'is not a new string' do
      expect(meetings).not_to be_a_new(String)
    end
  end

  describe '#create' do
    subject { post :create, params: { meeting: { date: '2017-09-07',
                                                 start_time: '2000-01-01 10:00:00',
                                                 key_note: 'first meeting',
                                                 duration: 15.0,
                                                 organiser_id: User::Employee.first,
                                                 venue_id: 5
                                                } } }

    it 'redirects to meetings_url' do
      expect(subject).to redirect_to action: :index
    end
  end

  describe '#invalid create' do
    subject { post :create, params: { meeting: { date: '2017-09-07',
                                                 start_time: '2000-01-01 10:00:00',
                                                 key_note: 'first meeting',
                                                 duration: 15.0,
                                                 organiser_id: User::Employee.first,
                                                 venue_id: 5
                                                } } }

    it 'doesn\'t redirects to meetings_url' do
      expect(response.status).to_not redirect_to action: :index
    end
  end

  describe '#edit' do
    params = { meeting: { date: '2017-09-07',
                          start_time: '2000-01-01 10:00:00',
                          key_note: 'first meeting',
                          duration: 15.0,
                          venue_id: 5 },
               id: User::Employee::Meeting.first
    }
    subject { patch :update, params: params }

    it 'redirects to meetings_url' do
      expect(subject).to redirect_to action: :index
    end
  end

  describe '#invalid edit' do
    params = { meeting: { date: '2017-09-07',
                          start_time: '2000-01-01 10:00:00',
                          key_note: 'first meeting',
                          duration: 'gj',
                          venue_id: 5 },
               id: User::Employee::Meeting.first
    }
    subject { patch :update, params: params }

    it 'redirects to meetings_url' do
      expect(subject).to render_template(:edit)
    end
  end


  describe '#destroy' do
    subject { delete :destroy, params: { id: User::Employee::Meeting.last } }
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

  describe '#add member' do
    subject { get :add_members, params: { id: Meeting.first.id } }
    it 'should render add_members template' do
      expect(subject).to render_template(:add_members)
    end
  end

  describe '#add member post request' do
    subject { post :add_members, params: { meeting_id: Meeting.first.id,
                                          selected: { '13' => '0'},
                                          id:'74'
                                           } }
    it 'should return status 302' do
      expect(subject).to redirect_to(users_employees_meetings_url)
    end
  end

  describe '#remove member' do
    subject { get :remove_members, params: { id: Meeting.first.id } }
    it 'should render remove_members template' do
      expect(subject).to render_template(:remove_members)
    end
  end

  describe '#remove member post request' do
    subject { post :remove_members, params: { meeting_id: Meeting.first.id,
                                          selected: { '13' => '0'},
                                          id:'74'
                                           } }
    it 'should return status 302' do
      expect(subject).to redirect_to(users_employees_meetings_url)
    end
  end

end
