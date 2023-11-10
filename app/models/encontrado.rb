class Encontrado < ApplicationRecord
    has_one_attached :photo
    validate :validacion_perros_no_repetidos
    validates :nombre, length: { maximum: 25, message: "La longitud del nombre debe ser mas de 25 caracteres" }
    validates :ubicacion, length: { maximum: 70, message: "La longitud de la ubicacion debe ser mas de 70 caracteres" }
    validates :raza, length: { maximum: 30, message: "La longitud de la raza debe ser mas de 25 caracteres" }
    validates :nombre, presence: true, presence: { message: "no puede estar en blanco" }
    validates :tamano, presence: true, presence: { message: "no puede estar en blanco" }

    belongs_to :user

    validates :raza, presence: true, presence: { message: "no puede estar en blanco" }
    validates :ubicacion, presence: true, presence: { message: "no puede estar en blanco" }
    private

    def validacion_perros_no_repetidos
    # Se asume que `autor_id` es un atributo en la instancia de `Perdido`
      if User.find(user_id).encontrados.exists?(nombre: nombre)
        errors.add(:base, "Ya hiciste una publicacion de este perrito")
      end
    end
 end
