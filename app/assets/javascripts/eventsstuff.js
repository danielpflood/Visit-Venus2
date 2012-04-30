$(function() {
	$("#events th a, #events .pagination a").live("click", function() {
	    $.getScript(this.href);
	    return false;
	  });
  	$("#events_search input").keyup(function() {
	    $.get($("#events_search").attr("action"), $("#events_search").serialize(), null, "script");
	    return false;
	  });
});
