var VenueController = Marionette.Controller.extend({
  index: function() {
    var venues = new App.Models.Venue();
    venues.fetch().done(function() {
      var venue_view = new VenueIndexLayout({model: venues});
      $('body').html(venue_view.render().$el);      
    })
  },

  new: function(){
  	console.log('venue#new');
    // var new_venue_view = new NewVenueView();
    // $('body').html(new_venue_view.render().$el);
  },

  show: function(){
  	console.log('venue#show');
  },
  
  edit: function(){
  	console.log('venue#edit');
  }

});