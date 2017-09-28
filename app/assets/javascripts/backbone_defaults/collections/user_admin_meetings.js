
App.Collections.AdminMeetings = Backbone.Collection.extend({
	model: App.Models.AdminMeeting, 
	url: '/users/admins/meetings'
})