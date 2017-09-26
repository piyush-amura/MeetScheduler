VenueItemView = Marionette.ItemView.extend({

  tagName: "tr",

  template: JST['venue'],

  events: {
  	'click .edit': 'edit_venue',
  	'click .delete': 'delete_venue'  	
  },

  edit_venue: function(event) {
  	var id = $(event.currentTarget).data('id');
    Backbone.history.navigate('venues/' + id + '/edit', {trigger: true} );
  	},

  delete_venue: function(event){
 	this.model.destroy();
  },

  serializeData: function() {
  	return {
  		'venue' : this.model.attributes
  	}
  }
});