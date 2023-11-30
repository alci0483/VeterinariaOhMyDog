class Turno < ApplicationRecord
 validate :validacion_turnos_no_repetidos
    attribute :primera_visita, :boolean
    validates :banda_horaria, inclusion: { in: ["Turno 1 - 8 a 13 hs", "Turno 2 - 16 a 22 hs"] }
    validates :fecha, presence: true
    validates :descripcion, presence: true
    belongs_to :user

    private
# no se permiten sacar turnos en la misma vanda horaria en ese dia
   def validacion_turnos_no_repetidos
     if user.turnos.exists?(banda_horaria: banda_horaria) && !user.turnos.where(banda_horaria: banda_horaria, fecha: fecha).empty?
      errors.add(:base, "No se puede sacar turno para esa Banda Horaria ")
     end
  end

end
