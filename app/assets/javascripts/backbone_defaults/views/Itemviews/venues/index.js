VenueIndexView = Marionette.ItemView.extend({

  template: JST['venue'],

  events: {
  	'click #edit': 'edit_venue',
  	'click #delete': 'delete_venue'  	
  },

  edit_venue: function(event) {
  	var id = $('#edit').attr('venue_id');
  	// $('body').append('<div><p>help</p></div>');
  	// Backbone.history.navigate(`venues/${id}/edit`, {trigger: true} );
  },

  delete_venue: function(event){
  },

  serializeData: function() {
  	return {
  		'venues' : this.model.attributes
  	}
  }

});