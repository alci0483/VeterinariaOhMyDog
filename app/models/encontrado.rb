class Encontrado < ApplicationRecord
    has_one_attached :photo
    
    validate :validacion_perros_no_repetidos
    validates :nombre, length: { maximum: 25, message: "La longitud del nombre debe ser mas de 25 caracteres" }
  
    validates :raza, length: { maximum: 30, message: "La longitud de la raza debe ser mas de 25 caracteres" }
    validates :nombre, presence: true, presence: { message: "no puede estar en blanco" }
    validates :tamano, presence: true, presence: { message: "no puede estar en blanco" }
    
    belongs_to :user

    validates :raza, presence: true, presence: { message: "no puede estar en blanco" }
    validates :ubicacion, presence: true, presence: { message: "no puede estar en blanco" }
    

    #codigo nuevo
    
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :codigo, presence: true
    private
    def validacion_perros_no_repetidos
    # no repetidos por nombre y email
      if User.find(user_id).encontrados.exists?(nombre: nombre, email: email)
        errors.add(:base, "Ya hiciste una publicacion de este perrito")
      end
    end
    
    # codigo nuevo

 end
