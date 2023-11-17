json.extract! perro, :id, :nombre, :edad, :raza, :sexo, :estado_salud, :user_id, :created_at, :updated_at
json.url perro_url(perro, format: :json)
