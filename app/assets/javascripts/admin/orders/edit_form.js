$(document).ready(function() {
  $.each($('td.qty input'), function(i, input) {

    $(input).live('change', function() {

      var id = "#" + $(this).attr('id').replace("_quantity", "_id");
      console.log($(this))
      console.log($(id))

      jQuery.post("/admin/orders/" + $('input#order_number').val() + "/line_items/" + $(id).val(),
        { _method: "put", "line_item[quantity]": $(this).val()},
        function(resp) {
          $('#order-form-wrapper').html(resp.responseText);
      })
    })
  })
});

