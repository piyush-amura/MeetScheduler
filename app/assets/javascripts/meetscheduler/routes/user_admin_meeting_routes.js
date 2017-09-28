adminMeetingController= new AdminMeetingController();

AdminMeetingRouter = Marionette.AppRouter.extend({
  controller: adminMeetingController,
  appRoutes: {
    'users/admins/meetings': 			              'index',
    'users/admins/meetings/new':   	            'new',
    'users/admins/meetings/:id':                'show',
    'users/admins/meetings/:id/edit':           'edit',
    'users/admins/meetings/:id/add_members':    'add_members',
    'users/admins/meetings/:id/remove_members': 'remove_members'
  },

  onRoute: function(name, path, args) {
    console.log('User navigated to ' + path);
  }
});