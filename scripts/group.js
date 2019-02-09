// JavaScript Document

$(document).ready(function () {
	
 "use strict";
 $('.panel-collapse').on('show.bs.collapse', function () {
	
	console.log("Show");
    $(this).siblings('.panel-heading').addClass('active');
  });

  $('.panel-collapse').on('hide.bs.collapse', function () {
	  
	  console.log("Hide");
    $(this).siblings('.panel-heading').removeClass('active');
  });
});