agendaController= new AgendaController();

AgendaRouter = Marionette.AppRouter.extend({
  controller: agendaController,
  appRoutes: {
    'agendas': 			     'index',
    'agendas/new':   	   'new',
    'agendas/:id':       'show',
    'agendas/:id/edit':  'edit'
  },

  onRoute: function(name, path, args) {
    console.log('User navigated to ' + path);
  }
});