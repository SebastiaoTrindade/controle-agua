document.addEventListener("DOMContentLoaded", function () {
  let submitButton = document.querySelector("#btnSalvar");

  if (!submitButton) {
    console.error("Erro: Botão de salvar não encontrado!");
    return;
  }

  submitButton.addEventListener("click", function (event) {
    event.preventDefault(); // Evita o reload da página

    let manha = document.querySelector("#medicaoManha").value;
    let tarde = document.querySelector("#medicaoTarde").value;

    fetch("/medicoes", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content
      },
      body: JSON.stringify({ medicao: { manha: manha, tarde: tarde } })
    })
      .then(response => response.json())
      .then(data => {
        if (data.message) {
          alert(data.message); // Exibe uma mensagem de sucesso
          document.querySelector("#consumoTotal").textContent = data.consumo_total + " m³"; // Atualiza o consumo total
        } else {
          alert("Erro ao salvar medição.");
        }
      })
      .catch(error => console.error("Erro:", error));
  });
});
