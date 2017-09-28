$(document).ready(function() {
  var app = new Backbone.Marionette.Application();

  new VenueRouter();
  new AdminMeetingRouter();
  new EmployeeMeetingRouter();
  new UserRouter();
  new AgendaRouter();
  new SuggestionRouter();

  app.on('start', function() {
    Backbone.Model.prototype.idAttribute = "_id";
  });

  app.start();

  Backbone.history.start({pushState: true});

});