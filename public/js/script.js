/*=====script for the data show and hide of policies starts=====*/
$(".link").click(function(e) {
 e.preventDefault();
 $('.content-container div').fadeOut('fast');
 $('#' + $(this).data('rel')).fadeIn('fast');
});
/*=====script for the data show and hide of policies ends=====*/


/*=====script for only one of the policies to show when page loads starts=====*/
$(document).ready(function() {
$('#text_ship_del_discl').hide();
$('#text_special_day_discl').hide();
$('#text_priv_pol').hide();
$('#text_tou_def').hide();
$('#text_comm').hide();
$('#text_pdt_pric').hide();
$('#text_ship_deli_pol').hide();
$('#text_subst_pol').hide();
$('#text_dam_def_pdt').hide();
$('#text_exchnge_pol').hide();
$('#text_order_mod_can').hide();
$('#text_conf').hide();
$('#text_accept').hide();
$('#text_duplicate').hide();
$('#text_payment').hide();
$('#text_offers').hide();
$('#text_feedback_sugges').hide();
});
/*=====script for only one of the policies to show when page loads ends=====*/

// Material Select Initialization
$(document).ready(function() {
   $('.mdb-select').material_select();
 });
 //===================//
//==========counter function starts=========//
  $('.start_count').each(function () {
    $(this).prop('Counter',0).animate({
        Counter: $(this).text()
    }, {
        duration: 7000,
        easing: 'swing',
        step: function (now) {
            $(this).text(Math.ceil(now));
        }
    });
});
//=============counter function ends============//
//==============contact message sent starts=============//
$('#msg_sent').hide();
$('#form_submit').click(function(){
  $('#msg_sent').show();
});
//==============contact message sent ends=============//

//===========pop_pdt_hover_action starts===================//

//===========pop_pdt_hover_action ends===================//
