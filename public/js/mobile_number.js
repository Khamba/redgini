$(document).ready(function(){
  // submit mobile number through ajax
  $("#enter_mobile_number").submit(function(e) {
      var url = "mobile_number/send_otp"; // the path where you handle the form input.
      $.ajax({
             type: "POST",
             url: url,
             data: $("#enter_mobile_number").serialize(), // serializes the form's elements.
             success: function(data){
                 console.log(data); // show response from the php script.
                 $('button#mobile_number_submit').prop('disabled', true);
             }
           });
      e.preventDefault(); // avoid to execute the actual submit of the form.
  });
});
