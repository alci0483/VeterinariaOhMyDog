class Adopcion < ApplicationRecord
  validates_uniqueness_of :nombre, scope: [:tamanio, :edad, :ubicacion, :raza], message: "Ya existe una Publicacion con estos mismos datos."
  belongs_to :user
end
