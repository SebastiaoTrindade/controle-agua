json.extract! medicao, :id, :user_id, :data, :medicao_manha, :medicao_tarde, :consumo_total, :created_at, :updated_at
json.url medicao_url(medicao, format: :json)
