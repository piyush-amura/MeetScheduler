VenuesCompositeView = Marionette.CompositeView.extend({
	template: JST['venuescomposite'],
	childView: VenueItemView,
	childViewContainer: 'tbody'
});