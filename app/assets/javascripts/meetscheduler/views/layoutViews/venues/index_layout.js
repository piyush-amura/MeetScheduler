VenuesIndexLayout = Marionette.LayoutView.extend({

  template: JST['default'],

  regions: {
    head:   '.head',
    search: '.search',
    list:   '.list'
  },

  onRender: function() {
    this.showChildView('head',new NavBarView());
    this.showChildView('search',new SearchBarView({collection: this.collection}) );
    this.showChildView('list', new VenuesCompositeView( { collection: this.collection } ) );
  }
});