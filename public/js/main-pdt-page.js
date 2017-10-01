jQuery(document).ready(function(){
    // This button will increment the value
    $('.qtyplus').click(function(e){
        // Stop acting like a button
        e.preventDefault();
        // Get the input element
        input_element = $(this).parent().parent().find('input.qty');
        // Get its current value
        var currentVal = parseInt(input_element.val());
        // If is not undefined
        if (!isNaN(currentVal)) {
            // Increment
            input_element.val(currentVal + 1);
        } else {
            // Otherwise put a 1 there
            input_element.val(1);
        }
    });
    // This button will decrement the value till 0
    $(".qtyminus").click(function(e) {
        // Stop acting like a button
        e.preventDefault();
        // Get the input element
        input_element = $(this).parent().parent().find('input.qty');
        // Get its current value
        var currentVal = parseInt(input_element.val());
        // If it isn't undefined or its greater than 1
        if (!isNaN(currentVal) && currentVal > 1) {
            // Decrement one
            input_element.val(currentVal - 1);
        } else {
            // Otherwise put a 1 there
            input_element.val(1);
        }
    });
});
