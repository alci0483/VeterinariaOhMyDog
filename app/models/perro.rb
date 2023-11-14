class Perro < ApplicationRecord
  belongs_to :user
  validate :validacion_perros_no_repetidos, on: :create

  def validacion_perros_no_repetidos
  # Verifica si el usuario actual está presente y ya tiene un perro con el mismo nombre
  if self.user.present? && self.user.perros.exists?(nombre: nombre)
    errors.add(:base, "Ya tienes un perro con este nombre")
  end
end

end
