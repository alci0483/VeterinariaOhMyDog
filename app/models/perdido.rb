class Perdido < ApplicationRecord
  has_one_attached :photo
  validate :validacion_perros_no_repetidos
  validates :nombre, length: { maximum: 25, message: "La longitud del nombre debe ser mas de 25 caracteres" }
  validates :ubicacion, length: { maximum: 70, message: "La longitud de la ubicacion debe ser mas de 70 caracteres" }
  validates :raza, length: { maximum: 30, message: "La longitud de la raza debe ser mas de 25 caracteres" }
  
  validates :nombre, presence: true, presence: { message: "no puede estar en blanco" }  
  validates :tamano, presence: true, presence: { message: "no puede estar en blanco" }
  validates :edad, presence: true, presence: { message: "no puede estar en blanco" }
  validates :raza, presence: true, presence: { message: "no puede estar en blanco" }
  validates :ubicacion, presence: true, presence: { message: "no puede estar en blanco" }
  
  validates :nombre, length: { is: 50, message: "La longitud del nombre debe ser de 50 caracteres" }
  private
  def validacion_perros_no_repetidos
    if Perdido.exists?(nombre: nombre, tamano: tamano, edad: edad, raza: raza, ubicacion: ubicacion)
      errors.add(:base, "Ya hiciste una publicacion de este perrito")
    end
  end
  
  
  
end
