# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/



$(document).ready ->
	$('.best_in_place').best_in_place()
	$('.bounce_on_success').bind("ajax:success", ->
		$(this).closest('tr').effect('bounce')
	)
	$('.best_in_place').bind("ajax:success", ->
		date_time_pre = $(this).text()
		date_time_pre = date_time_pre.replace(/-/g,"/")
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
		$(this).closest('tr').effect('highlight')
	)


	$("#best_in_place_task_78_date_time").triggerHandler("DateUpdate");
	$('#best_in_place_task_78_date_time').text()
