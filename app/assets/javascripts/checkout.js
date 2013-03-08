$(document).ready(function () {
    $('#new_credit_card')
        .bind('ajax:success', function (data, card, xhr) {
            var errorElements = document.getElementsByClassName('error');
            for (var element in errorElements) {
                element.className = "field";
            }
            $('#collapseCard').collapse('hide');
            $('#collapseShipping').collapse('show');
            $('#card_transaction').val(card.id);
        })
        .bind('ajax:error', function (xhr, value, status) {
            errors(xhr, value, status);
        })

    $('#new_address')
        .bind('ajax:success', function (data, address, xhr) {
            var errorElements = document.getElementsByClassName('error');
            for (var element in errorElements) {
                element.className = "field";
            }
            $('#collapseShipping').collapse('hide');
            if ($('#billing_check_box').is(':checked')) {
                $('#collapseShippingMethod').collapse('hide');
            } else {
                $('#collapseBilling').collapse('hide');
            }
            $('#address_transaction').val(address.id);
        })
        .bind('ajax:error', function (xhr, value, status) {
            errors(xhr, value, status);
        })

    $('#billing_check_box').bind('change', function () {
        $('#billing_address').toggle();
    });

    $('#submit_all').bind('click', function () {
        var showing_error = false;
        $("form").each(function () {
            var form = this;
            $.post(this.action, $(form).serialize(),function () {
                alert('success')
            }, 'json').fail(function (xhr, value, status) {
                    errors(xhr, value, status);
                    var errorDiv = form.parentElement;
                    if(!showing_error) {
                        eval("$('#" + errorDiv.id +"').collapse('show')");
                        showing_error = true;
                    } else {
                        var accordionDiv = errorDiv.previousSibling.previousSibling;
                        accordionDiv.className += " control-group error";
                        $(accordionDiv).insertBefore("<p>HERE</p>")
                    }
                });
        });
    });
});

function errors(value, status) {
    var errors = JSON.parse(value.responseText);
    for (var error in errors) {
        var stripedError;
        if ((/^card/).test(error)) {
            stripedError = new String(error.substring(5));
        } else {
            stripedError = error;
        }
        if (stripedError == 'expMonth' || stripedError == 'expYear') {
            stripedError = 'expiry_date'
        }
        var errorElement = document.getElementById(stripedError);
        errorElement.className += " control-group error";
        var messageElement = document.createElement("p");
        var message = document.createTextNode(errors[error]);
        messageElement.appendChild(message);
        errorElement.appendChild(messageElement);
    }
}