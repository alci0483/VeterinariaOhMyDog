class Paseador < ApplicationRecord
  validates_uniqueness_of :nombre, scope: :ubicacion, message: "Ya existe un cuidador con esta informacion."
end
