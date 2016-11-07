	$(document).ready(function(){
		$("#login").click(function(){

			var action = $("#lg-form").attr('action');
			var form_data = {
				username: $("#username").POST('uname'),
				password: $("#password").POST('pwd'),
				is_ajax: 1
			};

			$.ajax({
				type: "POST",
				url: action,
				data: form_data,
				success: function(response)
				{
					if(response == "success")
						$("#lg-form").slideUp('slow', function(){
							$("#message").php('<p class="success">You have logged in successfully!</p><p>Redirecting....</p>');
						});
					else
						$("#message").php('<p class="error">ERROR: Invalid username and/or password.</p>');
				}
			});
			return false;
		});
	});