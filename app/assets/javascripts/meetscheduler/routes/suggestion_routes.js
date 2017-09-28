suggestionController= new SuggestionController();

SuggestionRouter = Marionette.AppRouter.extend({
  controller: suggestionController,
  appRoutes: {
    'suggestions': 			     'index',
    'suggestions/new':   	   'new',
    'suggestions/:id':       'show',
    'suggestions/:id/edit':  'edit'
  },

  onRoute: function(name, path, args) {
    console.log('User navigated to ' + path);
  }
});