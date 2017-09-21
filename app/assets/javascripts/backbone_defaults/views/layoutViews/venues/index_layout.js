var VenueIndexLayout= Marionette.LayoutView.extend({
	
  template: JST['default'],	
  
  regions: {
  	head: '.head',
    list: '.list'
  },

  onRender: function() {
  	this.showChildView('head',new NavBarView() );
    this.showChildView('list',new VenueIndexView( {model: this.model} ) );
  }

});