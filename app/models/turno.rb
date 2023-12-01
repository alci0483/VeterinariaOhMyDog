class Turno < ApplicationRecord
    validate :validacion_turnos_no_repetidos
    validate :validacion_castracion
    validate :validacion_vacunacion
    validate :validacion_vacunacion1
    validate :validacion_vacunacion2
    validate :validacion_vacunacion3
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

    def validacion_castracion
      perro = Perro.find_by(nombre: nombre_perro)
      if tipo_servicio == 'castracion' && !perro.castracions.empty?
        errors.add(:base, "este perro ya fue castrado")
      end
    end

    def validacion_vacunacion
      perro = Perro.find_by(nombre: nombre_perro)
      if tipo_servicio == 'vacunacion' && perro.edad < 2
        errors.add(:base, "este perro es menor de dos meses, no se le puede aplicar ningun tipo de vacunacion")
      end
    end

    def validacion_vacunacion1
      perro = Perro.find_by(nombre: nombre_perro)
      if tipo_servicio == 'vacunacion' && perro.edad < 4 && !perro.vacunacions.where(tipo_vacuna: 'antirrabica').empty?
        v=perro.vacunacions.last
        if Date.today.to_time.to_i - v.created_at.to_time.to_i < 1814400
          errors.add(:base, "este perro no se puede aplicar la vacuna antirrabica porque tiene entre 2 y 3 meses y se la aplico hace menos de 21 dias")
          errors.add(:base, "tampoco se puede aplicar la vacuna parvovirus por ser menor a 6 meses")
        end
      end
    end

    def validacion_vacunacion2
      perro = Perro.find_by(nombre: nombre_perro)
      if tipo_servicio == 'vacunacion' && perro.edad > 3 && perro.edad < 6 && !perro.vacunacions.where(tipo_vacuna: 'antirrabica').empty?
        v=perro.vacunacions.last
        if Date.today.to_time.to_i - v.created_at.to_time.to_i < 31536000
          errors.add(:base, "este perro no se puede aplicar la vacuna antirrabica porque tiene entre 4 y 5 meses y se la aplico hace menos de un año")
          errors.add(:base, "tampoco se puede aplicar la vacuna parvovirus por ser menor a 6 meses")
        end
      end
    end

    def validacion_vacunacion3
      perro = Perro.find_by(nombre: nombre_perro)
      if tipo_servicio == 'vacunacion' && perro.edad > 5 && !perro.vacunacions.empty? && !perro.vacunacions.where(tipo_vacuna: 'antirrabica').empty?
        v=perro.vacunacions.last
        if Date.today.to_time.to_i - v.created_at.to_time.to_i < 31536000
          errors.add(:base, "este perro no se puede aplicar la vacuna antirrabica ni parvovirus porque tiene mas de 6 meses y se la aplico hace menos de un año")
        end
      end
    end

end
