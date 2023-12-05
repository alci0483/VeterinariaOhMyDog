class Adopcion < ApplicationRecord
  validates_uniqueness_of :nombre, scope: [:tamanio, :edad, :ubicacion, :raza], message: "Ya existe una Publicacion con estos mismos datos."
  belongs_to :user

  validate :validacion_perros_no_repetidos
  validates :estado, presence: true
  def validacion_perros_no_repetidos
    # Se asume que `autor_id` es un atributo en la instancia de `Perdido`
    if User.find(user_id).adopcions.exists?(nombre: nombre)
      errors.add(:base, "Ya hiciste una publicacion de este perrito")
    end
  end
end
