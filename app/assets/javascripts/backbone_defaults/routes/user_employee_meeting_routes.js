employeeMeetingController= new EmployeeMeetingController();

EmployeeMeetingRouter = Marionette.AppRouter.extend({
  controller: employeeMeetingController,
  appRoutes: {
    'users/employees/meetings': 			             'index',
    'users/employees/meetings/new':   	           'new',
    'users/employees/meetings/:id':                'show',
    'users/employees/meetings/:id/edit':           'edit',
    'users/employees/meetings/:id/add_members':    'add_members',
    'users/employees/meetings/:id/remove_members': 'remove_members'
  },

  onRoute: function(name, path, args) {
    console.log('User navigated to ' + path);
  }
});