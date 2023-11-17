json.extract! vacunacion, :id, :tipo_vacuna, :marca_vacuna, :dosis, :numero_lote, :created_at, :updated_at
json.url vacunacion_url(vacunacion, format: :json)
