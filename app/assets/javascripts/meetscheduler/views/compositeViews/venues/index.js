VenuesCompositeView = Marionette.CompositeView.extend({
	template: JST['venuescomposite'],
	childView: VenueItemView,
	model: App.Models.Venue,
	childViewContainer: 'tbody'
});