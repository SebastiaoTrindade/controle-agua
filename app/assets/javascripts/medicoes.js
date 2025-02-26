document.addEventListener("DOMContentLoaded", function() {
    // Salvar Medição da Manhã
    document.getElementById("salvar-manha").addEventListener("click", function() {
      let medicaoManha = parseFloat(document.getElementById("medicao-manha").value) || 0;
  
      fetch("/medicoes", {
        method: "POST",
        headers: {
          "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content,
          "Content-Type": "application/json"
        },
        body: JSON.stringify({ medicao: { medicao_manha: medicaoManha } })
      })
      .then(response => response.json())
      .then(data => {
        alert(data.message || "Erro ao salvar a medição da manhã!");
      })
      .catch(error => alert("Erro ao salvar a medição!"));
    });
  
    // Salvar Medição da Tarde e Atualizar Consumo Total
    document.getElementById("salvar-tarde").addEventListener("click", function() {
      let medicaoTarde = parseFloat(document.getElementById("medicao-tarde").value) || 0;
  
      fetch("/medicoes", {
        method: "POST",
        headers: {
          "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content,
          "Content-Type": "application/json"
        },
        body: JSON.stringify({ medicao: { medicao_tarde: medicaoTarde } })
      })
      .then(response => response.json())
      .then(data => {
        alert(data.message || "Erro ao salvar a medição da tarde!");
        if (data.consumo_total) {
          document.getElementById("consumo-total").innerText = data.consumo_total + " m³";
        }
      })
      .catch(error => alert("Erro ao salvar a medição!"));
    });
  });
  