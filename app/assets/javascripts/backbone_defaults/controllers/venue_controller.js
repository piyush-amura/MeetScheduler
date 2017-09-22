var VenueController = Marionette.Controller.extend({
  index: function() {
    var venues = new App.Collections.Venues();
    venues.fetch().done(function() {
      var venue_view = new VenueIndexLayout({collection: venues});
      $('body').html(venue_view.render().$el);      
    });
  },

  new: function(){
  	console.log('venue#new');
  },

  show: function(){
  	console.log('venue#show');
  },
  
  edit: function(){
  	console.log('venue#edit');
    $('body').html('<h1>hello edit</h1>')
  }

});