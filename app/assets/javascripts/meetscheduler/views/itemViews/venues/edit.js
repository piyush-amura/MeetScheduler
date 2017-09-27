VenueEditItemView = Marionette.ItemView.extend({
  template: JST['edit_venue'],

  events: {
    'click .edit': 'edited_venue_submit',
  },

  edited_venue_submit: function() {
    console.log('edited_venue_submit');

    this.model.set({name: $('#name').val(),
                capacity: $('#capacity').val(),
                 address: $('#address').val(),
                  status: $('#status').val()
    });
    this.model.save()
    Backbone.history.navigate('venues', {trigger: true} );
  }

});