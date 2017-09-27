VenuesEditLayout = Marionette.LayoutView.extend({
  initialize: function(options) {
    this.model = options.model;
  },
  template: JST['default'],

  regions: {
    head: '.head',
    list: '.list'
  },

  onRender: function() {
    this.showChildView('head',new NavBarView() );
    this.showChildView('list',new VenueEditItemView({ model: this.model } ) );
  }
});