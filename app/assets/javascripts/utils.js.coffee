@amountFormat = (amount) ->
  '$ ' + Number(amount).toLocaleString()
(($) ->
  $(document).ajaxStart ->
    $(".overlay-body").addClass('overlay')
    $('.loader').show()
    false
  .ajaxStop ->
    $(".overlay-body").removeClass('overlay');
    $(".loader").hide();
    false
) jQuery