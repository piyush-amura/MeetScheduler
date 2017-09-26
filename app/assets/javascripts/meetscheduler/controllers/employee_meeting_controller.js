var EmployeeMeetingController = Marionette.Controller.extend({
  index: function() {
    console.log('users/employees/meeting#index');
  },

  new: function(){
    console.log('users/employees/meeting#new');
  },

  show: function(){
    console.log('users/employees/meeting#show');
  },
  
  edit: function(){
    console.log('users/employees/meeting#edit');
  },

  add_members: function(){
    console.log('users/employees/meeting#add_members');
  },

  remove_members: function(){
    console.log('users/employees/meeting#remove_members');
  }
});