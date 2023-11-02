class Cuidador < ApplicationRecord
  validates_uniqueness_of :nombre, scope: :ubicacion, message: "Ya existe un cuidador con el mismo nombre y ubicación."

end
