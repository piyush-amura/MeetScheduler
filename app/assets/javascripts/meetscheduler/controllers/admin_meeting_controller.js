var AdminMeetingController = Marionette.Controller.extend({
  index: function() {
  	console.log('user/admin/meeting#index');
    var admin_meetings = new App.Models.AdminMeeting();
    admin_meetings.fetch().done(function() {
      var admin_meeting_view = new AdminMeetingIndexView({model: admin_meetings});
      $('body').html(admin_meeting_view.render().$el);
    })
  },

  new: function(){
  	console.log('user/admin/meeting#new');
  },

  show: function(){
  	console.log('user/admin/meeting#show');
  },
  
  edit: function(){
  	console.log('user/admin/meeting#edit');
  },

  add_members: function(){
    console.log('users/admins/meeting#add_members');
  },

  remove_members: function(){
    console.log('users/admins/meeting#remove_members');
  }

});