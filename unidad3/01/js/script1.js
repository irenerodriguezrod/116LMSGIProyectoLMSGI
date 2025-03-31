document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("boton1").addEventListener("click", saludar);
    document.getElementById("boton2").addEventListener("click", cambiarColor);
    document.getElementById("boton3").addEventListener("click", cambiarParrafos);
} // fin de la función
) // fin AddEventListener

//funcion saludar
function saludar() {
    alert("Hola, usuario! :)"); // muestra un mensaje 
}

//funcion cambiar color fondo
function cambiarColor() {
    let cuerpo = document.getElementById("cuerpo");
    let titulo = document.getElementById("titulo");

    if (cuerpo.style.backgroundColor === "black") {
        // si el color de fondo se corresponde con el color negro, se vuelve a modo claro
        cuerpo.style.backgroundColor = "white";
        cuerpo.style.color = "black";
        titulo.style.color = "black";
    } else {
        //cambia a modo oscuro en caso contrario
        cuerpo.style.backgroundColor = "black";
        cuerpo.style.color = "white";
        titulo.style.color = "white";
    }
}

// funcion cambiar parrafos
function cambiarParrafos() {
    let parrafos = document.querySelectorAll(".parrafo");

    parrafos.forEach((p) => {// la p es la abreviatura de párrafo, lo que hace es que por cada parrafo aplica unos estilos; depende del bucle if
        // este bucle sirve para verificar si ya tiene los estilos aplicados
        if (p.style.fontSize === "20px") {
            // en caso de que los tenga, volvemos al estado original
            p.style.fontSize = ""; //no se pone nada, se deja en blanco para que vuelva a los estilos que tenia de origen
            p.style.letterSpacing = "";
            p.style.fontWeight = "";
            p.style.transform = "";
        } else {
            // aplicamos los cambios en caso de que no los tenga
            p.style.fontSize = "20px"; // Aumenta el tamaño de la fuente
            p.style.letterSpacing = "2px"; // Aumenta el espaciado entre letras
            p.style.fontWeight = "bold"; // Aplica negrita
            p.style.transform = "rotate(1deg)"; // Aplica una ligera rotación
        }
    });
}
