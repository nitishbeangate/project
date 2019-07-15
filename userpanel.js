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
