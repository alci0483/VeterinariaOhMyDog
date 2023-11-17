class Perro < ApplicationRecord
  belongs_to :user
  validate :validacion_perros_no_repetidos
  # en el modelo Perro
  has_many :vacunacions
  has_many :castracions
  has_many :desparasitacions
  has_many :consulta_generals

  def validacion_perros_no_repetidos
  # Verifica si el usuario actual está presente y ya tiene un perro con el mismo nombre
    puts "Validando perros no repetidos..."
    puts "Usuario actual: #{self.user}"
    puts "Nombre del perro: #{nombre}"
    if self.user.present? && self.user.perros.exists?(nombre: nombre)
      errors.add(:base, "Ya tienes un perro con este nombre")
    end
  end

  #def edad_en_dias
     # Considerando que 'edad' es la edad en meses
  #   edad_meses = edad || 0
     # Calcular la edad en días (considerando 30.44 días por mes, un promedio para meses no bisiestos)
  #   edad_en_dias = (edad_meses * 30.44).to_i
  #   return edad_en_dias
   #end


end
