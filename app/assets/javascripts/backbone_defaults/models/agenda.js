App.Models.Agenda = Backbone.Model.extend({	
	urlRoot: '/agendas',
	initialize: function(){ this.on('change',this.someChange,this)},
	someChange: function(){
		alert('something has changed');
	}
})
