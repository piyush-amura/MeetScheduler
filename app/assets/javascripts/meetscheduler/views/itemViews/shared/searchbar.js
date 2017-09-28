SearchBarView = Marionette.ItemView.extend({

  template: JST['searchbar'],

  events: {
   'keyup #search_name': 'search'
  },

  search: function(){
    $.ajax({
      url: 'venues/search',
      type: 'POST',
      data: {name: $('#search_name').val() },
      dataType: 'json'
    })
    .done(function(response) {
      response.forEach(function(venue) {
        $('#venues').html('<option value ='+ venue.name +' > </option>')
      });
    })
    .fail(function(argument) {
      console.log('fail');
    });
  }
});