$(document).on('turbolinks:load',function(){
  $(".qtybutton").click(function(){
    var $input
    if($(this).hasClass("inc")){
      var oldVal = parseInt($(this).prev().find(".cart-plus-minus-box").val());
      var length = $(this).parent().parent().prev().text().trim().length;
      var price = parseInt($(this).parent().parent().prev().text().trim().slice(1,length));
      var newVal = parseInt(oldVal + 1);
      var length_grand_total = $(".grand-total").text().trim().length;
      var old_grand_total = parseInt($(".grand-total").text().trim().slice(1,length_grand_total));
      var new_grand_total = parseInt(old_grand_total + price)
      var subtotal = parseInt(price*newVal);
      $input = $(this).prev().find(".cart-plus-minus-box")
      $input.val(newVal);
      $(this).parent().parent().next().text("$" + subtotal);
      $(".grand-total").text("$" + new_grand_total);
    } else {
      var oldVal = parseInt($(this).next().find(".cart-plus-minus-box").val());
      var length = $(this).parent().parent().prev().text().trim().length;
      var price = parseInt($(this).parent().parent().prev().text().trim().slice(1,length));
      if (oldVal > 0) {
        var newVal = parseInt(oldVal - 1);
      }else {
        newVal = 0;
      }
      var length_grand_total = $(".grand-total").text().trim().length;
      var old_grand_total = parseInt($(".grand-total").text().trim().slice(1,length_grand_total));
      var subtotal = parseInt(price*newVal);
      var new_grand_total = parseInt(old_grand_total - price)
      $input = $(this).next().find(".cart-plus-minus-box")
      $input.val(newVal);
      $(this).parent().parent().next().text("$" + subtotal);
      $(".grand-total").text("$" + new_grand_total)
    }

    var $form = $input.closest("form");
    var method = "PUT";
    var action = $form.attr('action')
    // var id = $(".quantity-form form").find("#id").val();
    $.ajax({
      method: "PUT",
      url: action,
      data: $form.serialize(),
      dataType: "script"
    });
  });
});

$(document).on("turbolinks:load",function(){
  $("input#cart-btn").on("click",function(event){
    event.preventDefault();
    var action = $(this).parent().attr("action");
    var method = "POST";

    var product_id = $(this).parent().find("#product_order_product_id").val();
    var quantity = $(this).parent().find("#product_order_quantity").val();
    $.ajax({
      method: method,
      url: action,
      data: {product_id: product_id, quantity: quantity},
      dataType: "script",
    })
  });
});
