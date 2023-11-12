class Campana < ApplicationRecord
  has_one_attached :photo
  validates_uniqueness_of :nombre_campana, scope: :dni_titular_responsable, message: "Ya existe una Campaña con el mismo nombre y DNI de titular responsable."
end
