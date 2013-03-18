# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/



$(document).ready ->
	$('.Datepicker').datetimepicker({"dateFormat":"yy/mm/dd"});
	$('.best_in_place').best_in_place()
	$('.bounce_on_success').bind("ajax:success", ->
		$(this).closest('li').effect('bounce')
	)
	$('.best_in_place').bind("ajax:success", ->

		console.log($(this).attr("data-original-content"));
		date_time_pre = $(this).text()
		date_time_pre = date_time_pre.replace(/-/g,"/")
		date_time_pre = date_time_pre.replace('UTC',"(PDT)")
		date_time = new Date();
		date_time = new Date(date_time_pre );
		console.log(date_time)
		id = $(@).parent().attr("id")
		id = id.replace('task_',"");
		data = $('.date#task_' + id + ' span').attr("data-original-content", date_time_pre);
		console.log(data);
		console.log('#defaultCountdown.' + id)
		if (isNaN(date_time) == false)
			$('#defaultCountdown.' + id).countdown('destroy');
			$('#defaultCountdown.' + id).countdown({until: date_time})
	)

	$('.best_in_place').bind("ajax:success", ->
		date_time_pre = $(this).text()
		date_time_pre = date_time_pre.replace(/-/g,"/")
		date_time_pre = date_time_pre.replace('UTC',"(PDT)")
		date_time = new Date();
		date_time = new Date(date_time_pre );
		console.log(date_time)
		id = $(this).parent().attr("id")
		id = id.replace('task_',"");
		console.log('#defaultCountdown.' + id)
		if (isNaN(date_time) == false)
			$('#defaultCountdown.' + id).countdown('destroy');
			$('#defaultCountdown.' + id).countdown({until: date_time})
	)
	$('.highlight_on_success').bind("ajax:success", ->
		$(this).closest('li').effect('highlight')
	)



