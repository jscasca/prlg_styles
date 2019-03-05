// JavaScript Document

function readUrl(input) {
	"use strict";
	
	if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function () {
     
		$('.profile-image-placeholder').attr('src',  reader.result);
    };
	reader.readAsDataURL(input.files[0]);	
  }
}

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
	
	
  //Use these two variables to save existing text to restore if user cancels
  var savedTitle ='';
  var savedDescription = '';
	
  var editButton = $('#edit-club-description-button');
	
  $(editButton).click(function() {
	  
	  var clubTitle = $('#club-title');
	  var clubDesc = $('#club-description');
	  var actionButtons = $('#edit-description-action-buttons');
	  
	  $(clubTitle).prop('disabled', false);
	  $(clubDesc).prop('disabled', false);
	  $(actionButtons).prop('hidden', false);
	  $(editButton).prop('hidden', true);
	  
	  savedTitle=$(clubTitle).val();
	  savedDescription=$(clubDesc).val();
  });	
  
	$('#cancel-club-description-button').click(function() {
		var clubTitle = $('#club-title');
	  	var clubDesc = $('#club-description');
	  	var actionButtons = $('#edit-description-action-buttons');
		
		$(clubTitle).prop('disabled', true);
	  	$(clubDesc).prop('disabled', true);
		$(actionButtons).prop('hidden', true);
		$(editButton).prop('hidden', false);
		
		$(clubTitle).val(savedTitle);
		$(clubDesc).val(savedDescription);
	});
	
	$('#save-club-description-button').click(function() {
		//This is where the backend needs to be called
		
		var clubTitle = $('#club-title');
	  	var clubDesc = $('#club-description');
	  	var actionButtons = $('#edit-description-action-buttons');
		
		$(clubTitle).prop('disabled', true);
	  	$(clubDesc).prop('disabled', true);
		$(actionButtons).prop('hidden', true);
		$(editButton).prop('hidden', false);
	});
	
	var profilePlaceholder = $('.profile-image-placeholder');
	var savedSrc;
	
	$('#change-profile-image-button').click(function() {
		
		savedSrc = profilePlaceholder.attr('src');
		
		$('#change-profile-image-button').removeClass("in");
		$('#edit-profile-dialog').addClass("in");
	});
	
	$('#edit-profile-save-button').click(function() {
		$('#change-profile-image-button').addClass("in");
		$('#edit-profile-dialog').removeClass("in");
	});
	
	$('#edit-profile-cancel-button').click(function() {
		
		$('#change-profile-image-button').addClass("in");
		$('#edit-profile-dialog').removeClass("in");
		
		$('.profile-image-placeholder').attr('src',  savedSrc);
	});
});