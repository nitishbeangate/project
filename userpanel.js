 $(document).ready(function(){
    $("#account1").show();
    $("#account").addClass("active");
    $(".list-group a").click(function(){
      $("#account1").fadeOut();
      $("#tab_div .panel-default").hide();
      $(".list-group a").removeClass("active");
      $(this).addClass("active");
      var a=$(this).attr("id");
      $('#'+a+'1').fadeIn();
      
    })
<input list="browsers" name="browser" class="form-control " id="searchcity">
  <datalist id="browsers">
    <option value="Internet Explorer">
    <option value="Firefox">
    <option value="Chrome">
    <option value="Opera">
    <option value="Safari">
  </datalist>
  $("nexttopayment").click(function(){
    	var seatno=[];
        var pname=[];
        var pgender=[];
        var p_age=[];
        $('.seatno').each(function(){
        	   seatno.push($(this).val());
        	  });
        	  $('.pname').each(function(){
        	   pname.push($(this).val());
        	  });
        	  $('.pgender').each(function(){
        	   pgender.push($(this).val());
        	  });
        	  $('.p_age').each(function(){
           	   p_age.push($(this).val());
           	  });
    });
