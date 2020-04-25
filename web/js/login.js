// Banco TMD
// Progra I Ciclo, 2020


function goto() {
    if (validar() === true) {
        mostrarModalValidando();}
}

function validar() {
    var validacion = true;

    //Elimina estilo de error en los css
    //notese que es sobre el grupo que contienen el input
    $("#groupUsario").removeClass("has-error");
    $("#groupPassword").removeClass("has-error");

    //valida cada uno de los campos del formulario
    //Nota: Solo si fueron digitados
    if ($("#cedula").val() === "") {
        $("#groupUsario").addClass("has-error");
        mostrarModalErrorFaltaDatos();
        validacion = false;
    }
    if ($("#contraseña").val() === "") {
        $("#groupPassword").addClass("has-error");
        mostrarModalErrorFaltaDatos();
        validacion = false;
    }
    return validacion;
}

function limpiarForm() {
    //setea el focus del formulario
    $('#usuario').focus();

    //Resetear el formulario
    $('#formLogin').trigger("reset");
}


function mostrarModalErrorFaltaDatos() {
    $('#infoModal').modal();
    document.getElementById("mensaje_error").innerHTML = "Por favor complete todos los campos";
}

function mostrarModalErrorAdmin() {
    $('#infoModal').modal();
    document.getElementById("mensaje_error").innerHTML = "Error inesperado, conteacte al administrador";
}

function mostrarModalErrorValidacion() {
    $('#infoModal').modal();
    document.getElementById("mensaje_error").innerHTML = "Usuario o Contraseña incorrecta, por favor verifique la datos ingresados.";
}

function mostrarModalValidando() {
    $('#infoModal').modal();
    document.getElementById("mensaje_error").innerHTML = "Validando la información por favor espere";
    document.getElementById("mensaje_error").style.color = "blue";
}

function mostrarMensaje(classCss, msg, neg) {
    //se le eliminan los estilos al mensaje
    $("#mesajeResult").removeClass();

    //se setean los estilos
    $("#mesajeResult").addClass(classCss);

    //se muestra la capa del mensaje con los parametros del metodo
    $("#mesajeResult").fadeIn("slow");
    $("#mesajeResultNeg").html(neg);
    $("#mesajeResultText").html(msg);
    $("#mesajeResultText").html(msg);
}
