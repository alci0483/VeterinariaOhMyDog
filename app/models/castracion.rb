class Castracion < ApplicationRecord
    belongs_to :perro
    validate :unica_castracion_por_perro

    private

    def unica_castracion_por_perro
      if self.perro.present? && self.perro.castracions.exists?
        errors.add(:base, "Ya esta castrado tu perro")
      end

    end
  end
