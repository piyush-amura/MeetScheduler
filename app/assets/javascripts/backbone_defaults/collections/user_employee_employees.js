App.Collections.EmployeeMeetings = Backbone.Collection.extend({
	model: App.Models.EmployeeMeeting,
	url: '/users/employees/meetings'
})