class Perro < ApplicationRecord
  belongs_to :user
  validate :validacion_perros_no_repetidos
  # en el modelo Perro
  has_many :vacunacions

  def validacion_perros_no_repetidos
  # Verifica si el usuario actual está presente y ya tiene un perro con el mismo nombre
  puts "Validando perros no repetidos..."
  puts "Usuario actual: #{self.user}"
  puts "Nombre del perro: #{nombre}"
  if self.user.present? && self.user.perros.exists?(nombre: nombre)
    errors.add(:base, "Ya tienes un perro con este nombre")
  end
end

end
