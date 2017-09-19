$(document).ready(function() {
	var app = new Backbone.Marionette.Application(); 

	new VenueRouter();
	new AdminMeetingRouter();
	new EmployeeMeetingRouter();
	new UserRouter();
	new AgendaRouter();
	new SuggestionRouter();

	app.start();
	Backbone.history.start({pushState: true});
});