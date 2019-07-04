<script>
  $(document).ready(function(){
$("#submitbutton").click(function(){
var email=$("#email").val();
var password=$("#password").val();
      if(!validateEmail(email))
      {
       alert("you have entered wrong email");
      }
      if(email=='admin@gmail.com' || password=='admin')
      {
        window.location="admin_home.html";
      }
      else
      {
        alert("wrong username and password");
      }
      });
function validateEmail($email) {
  var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
  return emailReg.test( $email );
}
  });

</script>
