var VenueController = Marionette.Controller.extend({
  index: function() {
    var venues = new App.Collections.Venues();
    venues.fetch().done(function() {
      var venues_view = new VenuesIndexLayout({collection: venues});
      $('body').html(venues_view.render().$el);
    });
  },

  new: function(){
  	console.log('venue#new');
    var venue_view = new VenuesNewLayout();
      $('body').html(venue_view.render().$el);
  },

  show: function(){
  	console.log('venue#show');
  },

  edit: function(id){
    console.log('venue#edit');
    var venue = new App.Models.Venue({_id: id });
    venue.fetch().done(function() {
      var venue_view = new VenuesEditLayout({model: venue})
      $('body').html(venue_view.render().$el);
    });
  }

});