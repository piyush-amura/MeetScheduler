venueController= new VenueController();

VenueRouter = Marionette.AppRouter.extend({
  controller: venueController,
  appRoutes: {
    'venues':           'index',
    'venues/new':       'new',
    'venues/:id':       'show',
    'venues/:id/edit':  'edit'
  },

  onRoute: function(name, path, args) {
    console.log('User navigated to ' + path);
  }
});