class Turno < ApplicationRecord
  validate :validacion_turnos_no_repetidos
  validate :validacion_castracion
  validate :validacion_vacunacion_antirrabica
  validate :validacion_vacunacion_antirrabica_1
  validate :validacion_vacunacion_antirrabica_2

  validate :validacion_castracion_edad
  validate :validacion_vacunacion_desparasitacion_edad

  validate :validacion_vacunacion_parvovirus
  validate :validacion_vacunacion_parvovirus_1

  validate :validacion_turno_pendiente_confirmado_antirrabica
  validate :validacion_turno_pendiente_confirmado_parvovirus
  validate :validacion_turno_pendiente_confirmado_castracion
  validate :validacion_turno_pendiente_confirmado_desparasitacion
  validate :validacion_turno_pendiente_confirmado_consulta_general


  attribute :primera_visita, :boolean
  validates :banda_horaria, inclusion: { in: ["Turno 1 - 8 a 13 hs", "Turno 2 - 16 a 22 hs"] }
  validates :fecha, presence: true
  validates :descripcion, presence: true
  belongs_to :user

    private
# no se permiten sacar turnos en la misma vanda horaria en ese dia
   def validacion_turnos_no_repetidos
     if ((user.turnos.exists?(nombre_perro: nombre_perro, tipo_servicio: tipo_servicio, banda_horaria: banda_horaria, estado_turno: "pendiente") && !user.turnos.where(nombre_perro: nombre_perro, tipo_servicio: tipo_servicio, banda_horaria: banda_horaria, fecha: fecha, estado_turno: "pendiente").empty?) || (user.turnos.exists?(nombre_perro: nombre_perro, tipo_servicio: tipo_servicio, banda_horaria: banda_horaria, estado_turno: "pendiente") && !user.turnos.where(nombre_perro: nombre_perro, tipo_servicio: tipo_servicio, banda_horaria: banda_horaria, fecha: fecha, estado_turno: "pendiente").empty?))
      errors.add(:base, "No se puede sacar turno para esa Banda Horaria ")
     end
  end

    def validacion_castracion
      perro = Perro.find_by(nombre: nombre_perro)
      if tipo_servicio == 'castracion' && !perro.castracions.empty?
        errors.add(:base, "este perro ya fue castrado")
      end
    end


    def validacion_castracion_edad
      perro = Perro.find_by(nombre: nombre_perro)
      if tipo_servicio == 'castracion' && perro.edad< 6
        errors.add(:base, "este perro  no puede sacar turno  para castracion por que tiene menos de 6 meses")
      end
    end

    def validacion_vacunacion_desparasitacion_edad
      perro = Perro.find_by(nombre: nombre_perro)
      if tipo_servicio == 'desparasitacion' && perro.edad< 3
        errors.add(:base, "este perro  no puede sacar turno  para desparasitacion por que tiene menos de 3 meses")
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
        if Date.today.to_time.to_i - v.created_at.to_time.to_i > 60 && Date.today.to_time.to_i - v.created_at.to_time.to_i < 1814400
          errors.add(:base, "este perro no se puede aplicar la vacuna antirrabica porque tiene entre 2 y 3 meses y se la aplico hace menos de 21 dias")
        end
      end
    end

    def validacion_vacunacion_antirrabica_2
      perro = Perro.find_by(nombre: nombre_perro)
      antirrabicas=perro.vacunacions.where(tipo_vacuna: 'antirrabica')
      if tipo_servicio == 'antirrabica' && perro.edad > 3 && !antirrabicas.empty?
        v=antirrabicas.last
        if Date.today.to_time.to_i - v.created_at.to_time.to_i > 60 && Date.today.to_time.to_i - v.created_at.to_time.to_i < 31536000
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
        if Date.today.to_time.to_i - v.created_at.to_time.to_i > 60 && Date.today.to_time.to_i - v.created_at.to_time.to_i < 31536000
          errors.add(:base, "este perro no se puede aplicar la vacuna parvovirus porque tiene al menos 6 meses y se la aplico hace menos de un año")
        end
      end
    end



    def validacion_turno_pendiente_confirmado_antirrabica
      if tipo_servicio=="antirrabica" && ((user.turnos.exists?(nombre_perro: nombre_perro, tipo_servicio: "antirrabica", estado_turno: "pendiente") && !user.turnos.where(nombre_perro: nombre_perro, tipo_servicio: "antirrabica", estado_turno: "pendiente").empty?) || (user.turnos.exists?(nombre_perro: nombre_perro, tipo_servicio: "antirrabica", estado_turno: "confirmado") && !user.turnos.where(nombre_perro: nombre_perro, tipo_servicio: "antirrabica", estado_turno: "confirmado").empty?))
       errors.add(:base, "no puede sacar otro turno para vacunacion antirrabica porque ya saco uno previamente ")
      end
    end

    def validacion_turno_pendiente_confirmado_parvovirus
      if tipo_servicio=="parvovirus" && ((user.turnos.exists?(nombre_perro: nombre_perro, tipo_servicio: "parvovirus", estado_turno: "pendiente") && !user.turnos.where(nombre_perro: nombre_perro, tipo_servicio: "parvovirus", estado_turno: "pendiente").empty?) || (user.turnos.exists?(nombre_perro: nombre_perro, tipo_servicio: "parvovirus", estado_turno: "confirmado") && !user.turnos.where(nombre_perro: nombre_perro, tipo_servicio: "parvovirus", estado_turno: "confirmado").empty?))
       errors.add(:base, "no puede sacar otro turno para vacunacion Parvovirus porque ya saco uno previamente ")
      end
    end

    def validacion_turno_pendiente_confirmado_castracion
      if tipo_servicio=="castracion" && ((user.turnos.exists?(nombre_perro: nombre_perro, tipo_servicio: "castracion", estado_turno: "pendiente") && !user.turnos.where(nombre_perro: nombre_perro, tipo_servicio: "castracion", estado_turno: "pendiente").empty?) || (user.turnos.exists?(nombre_perro: nombre_perro, tipo_servicio: "castracion", estado_turno: "confirmado") && !user.turnos.where(nombre_perro: nombre_perro, tipo_servicio: "castracion", estado_turno: "confirmado").empty?))
       errors.add(:base, "no puede sacar otro turno para castracion porque ya saco uno previamente ")
      end
    end

    def validacion_turno_pendiente_confirmado_desparasitacion
      if tipo_servicio=="desparasitacion" && ((user.turnos.exists?(nombre_perro: nombre_perro, tipo_servicio: "desparasitacion", estado_turno: "pendiente") && !user.turnos.where(nombre_perro: nombre_perro, tipo_servicio: "desparasitacion", estado_turno: "pendiente").empty?) || (user.turnos.exists?(nombre_perro: nombre_perro, tipo_servicio: "desparasitacion", estado_turno: "confirmado") && !user.turnos.where(nombre_perro: nombre_perro, tipo_servicio: "desparasitacion", estado_turno: "confirmado").empty?))
       errors.add(:base, "no puede sacar otro turno para desparasitacion porque ya saco uno previamente ")
      end
    end

    def validacion_turno_pendiente_confirmado_consulta_general
      if tipo_servicio=="consulta general" && ((user.turnos.exists?(nombre_perro: nombre_perro, tipo_servicio: "consulta general", estado_turno: "pendiente") && !user.turnos.where(nombre_perro: nombre_perro, tipo_servicio: "consulta general", estado_turno: "pendiente").empty?) || (user.turnos.exists?(nombre_perro: nombre_perro, tipo_servicio: "consulta general", estado_turno: "confirmado") && !user.turnos.where(nombre_perro: nombre_perro, tipo_servicio: "consulta general", estado_turno: "confirmado").empty?))
       errors.add(:base, "no puede sacar otro turno para consulta general porque ya saco uno previamente ")
      end
    end
end
