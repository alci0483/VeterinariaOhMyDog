# app/models/vacunacion.rb
class Vacunacion < ApplicationRecord
  belongs_to :perro
  validate :validar_edad_para_vacuna


  def validar_edad_para_vacuna

    edad_perro = Perro.find(perro_id).edad
    if  edad_perro < 2 && tipo_vacuna == "antirrabica"
      errors.add(:base, "No puedes aplicarle la vacuna antirrabica antes de los 2 meses")
    end

    if  edad_perro < 6 && tipo_vacuna == "parvovirus"
      errors.add(:base, "No puedes aplicarle la vacuna parvovirus antes de los 6 meses")
    end

  end
  #validate :validar_fecha_antirrabica, if: :tipo_vacuna_antirrabica?
  #validate :validar_fecha_parvovirus, if: :tipo_vacuna_parvovirus?

  #def tipo_vacuna_antirrabica?
  #  tipo_vacuna.downcase.include?('antirrábica')
  #end

  #def tipo_vacuna_parvovirus?
  #  tipo_vacuna.downcase.include?('parvovirus')
  #end

  #def validar_fecha_vacuna(edad_minima, dias_refuerzo, dias_sugerencia)
  #  if perro.present? && perro.edad_en_dias.present?
  #    if perro.edad_en_dias < edad_minima
  #      errors.add(:base, "No se puede aplicar antes de los #{edad_minima} días de vida del perro.")
  #    elsif perro.edad_en_dias < dias_refuerzo
  #      errors.add(:base, "Programar refuerzo a los #{dias_refuerzo} días.")
  #    elsif perro.edad_en_dias  <dias_sugerencia
  #      errors.add(:base, "Programar cita dentro de un año.")
  #    end
  #  end
  #end

  #def validar_fecha_antirrabica
  #  validar_fecha_vacuna(60, 120, 365)
  #end

  #def validar_fecha_parvovirus
  #  validar_fecha_vacuna(180, 365, 365)
  #end
end