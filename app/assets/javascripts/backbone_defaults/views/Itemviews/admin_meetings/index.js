AdminMeetingIndexView = Marionette.ItemView.extend({

  template: JST['admin_meetings'],

  serializeData: function() {
  	return {
  		'admin_meetings' : this.model.attributes
  	}
  }

  // onBeforeRender: function() {
  // 	var venues = new App.Models.Venue();
  // 	var meetings=this.model.attributes;
 	// 	venue_list = venues.fetch().done(function() {
 	// 	_.each(meetings,function(meeting) {
  // 		var v =_.find(venue_list,function(v) {
  // 			return v.id==meeting.venue_id;
  //   		});
  // 		console.log(v);
  // 	});
 	// });
 
  	// console.log(this.model.attributes);
  // }
});