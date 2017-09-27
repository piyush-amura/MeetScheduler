VenueNewItemView = Marionette.ItemView.extend({
  template: JST['new_venue'],

  events: {
    'click .save': 'saved_venue',
  },

  saved_venue: function() {
    console.log('saved_venue');
    venue = new  App.Models.Venue();
    venue.set({name: $('#name').val(),
           capacity: $('#capacity').val(),
            address: $('#address').val(),
             status: $('#status').val()
    });
    venue.save()
    Backbone.history.navigate('venues', {trigger: true} );
  }

});