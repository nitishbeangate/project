           $(document).ready(function(){
			$(".edit").click(function(){
            $(".save").removeClass('hidden');
             $(this).closest('tr').find('.admin_name, .admin_email').
             removeAttr('disabled');
             $(this).addAttr('disabled');
			});
			// add admin using ajax and jquery
			$("#add_admin").click(function(){
				var name = $("#aname").val();
				var email = $("#aemail").val();
				var password = $("#apassword").val();
				var cpassword = $("#acpassword").val();
				if (name == '' || email == '' || password == '' || cpassword == '')
				{
				$("#allfieldrequired").show();
				$("#allfieldrequired").hide(10000);
				} 
				else if(!validateEmail(email))
				    {
					$("#aderror").show().html("please enter valid email").hide(10000);
				    }
				else if(!validateUserName(name))
				    {
					$("#aderror").show().html("Name Contain Alphabet Only").hide(10000);
				    }
				else if ((password.length) < 8) 
				{
					$("#aderror").show().html("Password should atleast 8 character in length.").hide(10000);
				} else if (!(password).match(cpassword)) {
					
					$("#aderror").show().html("Enter Password or Confirm Password is not Matching !").hide(10000);
				} 
				else {		
			$.ajax({
			method:'POST',
			url:'db_file/add_admin_db.jsp',
			data:$('#admin_form').serialize(),
			success:function(data)
			{
				$("#adadded").show().html(data).hide(10000);
				$("#admin_form")[0].reset();
				
			},
			error:function()
			{
				$("#aderror").show().html(data).hide(10000);
			},
			
			});
				}
			});
			//email validation
			function validateEmail($email) {

			      var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;

			 

			      return emailReg.test( $email );

			 

			    }
			//use validation
			function validateUserName($name) {
			      var userNameReg =/^[a-zA-Z\s]+$/;
			      return userNameReg.test( $name);

			    };
			
			//retrieve data from database
			$(".delete").click(function(){
				$.ajax({
					method:'POST',
					url:'db_file/deleteAdmin.jsp',
					data:{adid:this.id},
					success:function(data)
					{
						if(data==0)
							{
							$("#aderror").show().html(data).hide(10000);
							}
						$("#adadded").show().html(data).hide(10000);
						
					},
					
					});
					});
			
		});
