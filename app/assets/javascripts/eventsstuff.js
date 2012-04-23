$(function() {
  	$("#events_search input").keyup(function() {
	    $.get($("#events_search").attr("action"), $("#events_search").serialize(), null, "script");
	    return false;
	  });
	$("#events_search input").change(function() {
	    $.get($("#events_search").attr("action"), $("#events_search").serialize(), null, "script");
	    return false;
	  });
});