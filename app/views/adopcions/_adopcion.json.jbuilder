json.extract! adopcion, :id, :nombre, :tamanio, :edad, :ubicacion, :raza, :created_at, :updated_at
json.url adopcion_url(adopcion, format: :json)
