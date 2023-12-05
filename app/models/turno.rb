class Turno < ApplicationRecord
  validate :validacion_turnos_no_repetidos
  validate :validacion_castracion
  validate :validacion_vacunacion_antirrabica
  validate :validacion_vacunacion_antirrabica_1
  validate :validacion_vacunacion_antirrabica_2

  validate :validacion_vacunacion_parvovirus
  validate :validacion_vacunacion_parvovirus_1

  attribute :primera_visita, :boolean
  validates :banda_horaria, inclusion: { in: ["Turno 1 - 8 a 13 hs", "Turno 2 - 16 a 22 hs"] }
  validates :fecha, presence: true
  validates :descripcion, presence: true
  belongs_to :user

    private
# no se permiten sacar turnos en la misma vanda horaria en ese dia
   def validacion_turnos_no_repetidos
     if user.turnos.exists?(banda_horaria: banda_horaria) && !user.turnos.where(banda_horaria: banda_horaria, fecha: fecha,tipo_servicio: tipo_servicio).empty?
      errors.add(:base, "No se puede sacar turno para esa Banda Horaria ")
     end
  end

    def validacion_castracion
      perro = Perro.find_by(nombre: nombre_perro)
      if tipo_servicio == 'castracion' && !perro.castracions.empty?
        errors.add(:base, "este perro ya fue castrado")
      end
    end

    def validacion_vacunacion_antirrabica
      perro = Perro.find_by(nombre: nombre_perro)
      if tipo_servicio == 'antirrabica' && perro.edad < 2
        errors.add(:base, "este perro es menor de dos meses, no se le puede aplicar la vacuna antirrabica")
      end
    end

    def validacion_vacunacion_antirrabica_1
      perro = Perro.find_by(nombre: nombre_perro)
      antirrabicas=perro.vacunacions.where(tipo_vacuna: 'antirrabica')
      if tipo_servicio == 'antirrabica' && perro.edad < 4 && !antirrabicas.empty?
        v=antirrabicas.last
        if Date.today.to_time.to_i - v.created_at.to_time.to_i > 1 && Date.today.to_time.to_i - v.created_at.to_time.to_i < 1814400
          errors.add(:base, "este perro no se puede aplicar la vacuna antirrabica porque tiene entre 2 y 3 meses y se la aplico hace menos de 21 dias")
        end
      end
    end

    def validacion_vacunacion_antirrabica_2
      perro = Perro.find_by(nombre: nombre_perro)
      antirrabicas=perro.vacunacions.where(tipo_vacuna: 'antirrabica')
      if tipo_servicio == 'antirrabica' && perro.edad > 3 && !antirrabicas.empty?
        v=antirrabicas.last
        if Date.today.to_time.to_i - v.created_at.to_time.to_i > 1 && Date.today.to_time.to_i - v.created_at.to_time.to_i < 31536000
          errors.add(:base, "este perro no se puede aplicar la vacuna antirrabica porque tiene al menos 4 meses y se la aplico hace menos de un año")
        end
      end
    end

    def validacion_vacunacion_parvovirus
      perro = Perro.find_by(nombre: nombre_perro)
      if tipo_servicio == 'parvovirus' && perro.edad < 6
        errors.add(:base, "este perro es menor de seis meses, no se le puede aplicar la vacuna parvovirus")
      end
    end

    def validacion_vacunacion_parvovirus_1
      perro = Perro.find_by(nombre: nombre_perro)
      v_parvovirus= perro.vacunacions.where(tipo_vacuna: 'antirrabica')
      if tipo_servicio == 'parvovirus' && perro.edad > 5 && !v_parvovirus.empty?
        v=v_parvovirus.last
        if Date.today.to_time.to_i - v.created_at.to_time.to_i > 1 && Date.today.to_time.to_i - v.created_at.to_time.to_i < 31536000
          errors.add(:base, "este perro no se puede aplicar la vacuna parvovirus porque tiene al menos 6 meses y se la aplico hace menos de un año")
        end
      end
    end

end
