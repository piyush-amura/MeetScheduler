userController= new UserController();

UserRouter = Marionette.AppRouter.extend({
  controller: userController,
  appRoutes: {
    'users/sign_in': 			    'sign_in',
    'users/sign_up':   	      'sign_up',
    'users/password/new':     'forgot_password',
    'users/password/edit':    'edit_user_password',
    'users/confirmation/new': 'confirm_email',
    'users/confirmation':     'user_confirmation',
    'users/cancel':           'cancel_user_registration',
    'users/edit':             'edit_user'
  },

  onRoute: function(name, path, args) {
    console.log('User navigated to ' + path);
  }
  
});