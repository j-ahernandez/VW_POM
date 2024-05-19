$(document).ready(function () {
    $('#form1')[0].reset();

    $(".loginControl").on("click", function (e) {
        e.preventDefault();

        swal({
            title: "¿Esta seguro?",
            text: "Salir del sistema",
            type: "info",
            showCancelButton: true,
            confirmButtonText: "¡Si, deseo salir del sistema!",
            closeOnConfirm: false,
            showLoaderOnConfirm: true,
            allowEscapeKey: false,
            allowOutsideClick: false
        }, function () {
            setTimeout(function () {
                salir();
            }, 1000);
        });
    });
    
});

function salir() {
    let url = '../Production/Default.aspx/destroySession';

    $.ajax({
        async: false,
        type: "POST",
        url: url,
        contentType: "application/json; charset=utf-8",
        dataType: 'json',
        success: function (data) {
            if (data.d == 1) {
                window.location = "../Login.aspx";
            }
        }
    });
}

function Mensaje(_title, _text, _type, _buttonClass) {
    swal({
        title: _title,
        text: _text,
        type: _type,
        confirmButtonClass: _buttonClass,
    });
}

function MaterialCritico() {
    swal({
        title: "ATENCION EL SIGUIENTE MATERIAL ESTA CONTROLADO",
        text: "Por favor validar con Almacen antes de solicitar este material",
        type: "error",
        confirmButtonClass: 'btn-danger'
    });
}

function getProfile() {
    let url = '../Production/Default.aspx/getProfile';
    let profile = "";

    $.ajax({
        async: false,
        type: "POST",
        url: url,
        contentType: "application/json; charset=utf-8",
        dataType: 'json',
        success: function (data) {
            profile = data.d;
        }

    });

    return profile;
}