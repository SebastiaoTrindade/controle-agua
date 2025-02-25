json.extract! medicao, :id, :user_id, :data, :manha, :tarde, :consumo_total, :created_at, :updated_at
json.url medicao_url(medicao, format: :json)
