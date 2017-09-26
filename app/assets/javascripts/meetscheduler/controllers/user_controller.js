var UserController = Marionette.Controller.extend({
  sign_in: function() {
  	console.log('sign_in');
  },
  
  sign_up: function(){
  	console.log('sign_up');
  },

  forgot_password: function(){
  	console.log('forgot_password');
  },
  
  confirm_email: function(){
  	console.log('confirm_email');
  },

  edit_user_password: function(){
    console.log('edit_user_password');  
  },

  user_confirmation: function(){
    console.log('user_confirmation');
  },

  cancel_user_registration: function(){
    console.log('cancel_user_registration');
  },

  edit_user: function() {
    console.log('edit_user');
  }
});