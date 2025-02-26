// Apagar notificação de cadastro
$(document).ready(function () {
  console.log("main.js carregado!");

  // Seleciona o alerta pelo ID 'notice'
  const notice = $('#notice');

  // Verifica se o alerta existe
  if (notice.length) {
    // Oculta o alerta após 2 segundos
    setTimeout(() => {
      notice.fadeOut('slow', () => {
        notice.remove(); // Remove o alerta do DOM após o fadeOut
      });
    }, 1000);
  }
});

// Validar os campos do login
document.addEventListener("DOMContentLoaded", function () {
  const submitButton = document.getElementById("submit-button");
  const emailField = document.getElementById("email");
  const passwordField = document.getElementById("password");

  submitButton.addEventListener("click", function (event) {
      const email = emailField?.value.trim(); 
      /*const passwordField = document.querySelector('input[type="password"]');*/
      const password = passwordField?.value.trim(); 

      if (!email || !password) {
          event.preventDefault(); // Impede o envio do formulário

          // Remove o alerta existente para evitar duplicação
          const existingAlert = document.getElementById("custom-alert");
          if (existingAlert) existingAlert.remove();

          // Cria o alerta
          const alertDiv = document.createElement("div");
          alertDiv.className = "alert alert-danger";
          alertDiv.id = "custom-alert";
          alertDiv.textContent = "Por favor, preencha o campo de login.";

          // Adiciona o alerta no contêiner fixo
          const alertContainer = document.getElementById("alert-container");
          alertContainer.appendChild(alertDiv);

          // Insere o alerta no topo da página
          const body = document.body;
          body.insertBefore(alertDiv, body.firstChild);

          // Move o cursor para o campo Email
          emailField?.focus();

          // Remove o alerta após 2 segundos
          setTimeout(() => {
              alertDiv.remove();
          }, 1000);
      }
  });
});
