VenuesCollectionView = Marionette.CollectionView.extend({
	childView: function(){
		console.log('in CollectionView');
		return VenueItemView;
	}
});
