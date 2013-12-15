$(document).ready(function()
{
	$('#take-action').click(function(){
		$('#action-area').fadeIn();
	});

	$('#ticket_contact_email').hide();
	$('#ticket_contact_no').hide();
	$('#hide_options').hide();
	$('#ticket_mode').change(function(){
		var value = $('#ticket_mode').val();
		$('#hide_options').show();
		if(value == 0){
			$('#ticket_contact_no').attr("visibility", "visible");
			$('#ticket_contact_email').attr("visibility", "gone");
			$('#ticket_contact_email').fadeOut();
			$('#ticket_contact_no').fadeIn();
		}else{
			$('#ticket_contact_no').attr("visibility", "gone");
			$('#ticket_contact_no').fadeOut();
			$('#ticket_contact_email').fadeIn();
			$('#ticket_contact_email').attr("visibility", "visible");
		}
	});
});