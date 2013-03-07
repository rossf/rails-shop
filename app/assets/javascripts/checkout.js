$(document).ready(function () {
    $('#new_credit_card')
        .bind('ajax:success', function (data, cart, xhr) {
            var errorElements = document.getElementsByClassName('error');
            for (var element in errorElements) {
                element.className = "field";
            }
            $('#collapseCard').collapse('hide');
            $('#collapseShipping').collapse('show');
        })
        .bind('ajax:error', function (xhr, value, status) {
            var errors = JSON.parse(value.responseText);
            for (var error in errors) {
                var strippedError;
                if ((/^card/).test(error)) {
                    strippedError = new String(error.substring(5));
                }
                var errorElement = document.getElementById(strippedError);
                errorElement.className += " control-group error";
                var messageElement = document.createElement("p");
                var message = document.createTextNode(errors[error]);
                messageElement.appendChild(message);
                errorElement.appendChild(messageElement);
            }
            ;
        })

    $('#new_address')
        .bind('ajax:success', function (data, cart, xhr) {
            var errorElements = document.getElementsByClassName('error');
            for (var element in errorElements) {
                element.className = "field";
            }
            $('#collapseShipping').collapse('hide');
            if($('#billing_check_box').is(':checked')) {
                $('#collapseShippingMethod').collapse('hide');
            } else {
                $('#collapseBilling').collapse('hide');
            }
        })
        .bind('ajax:error', function (xhr, value, status) {
            var errors = JSON.parse(value.responseText);
            for (var error in errors) {
                var errorElement = document.getElementById(error);
                errorElement.className += " control-group error";
                var messageElement = document.createElement("p");
                var message = document.createTextNode(errors[error]);
                messageElement.appendChild(message);
                errorElement.appendChild(messageElement);
            }
            ;
        })

    $('#billing_check_box').bind('change', function(){
          $('#billing_address').toggle();
    });

    $('#submit_all').bind
});