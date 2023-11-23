class Desparasitacion < ApplicationRecord
  belongs_to :perro
  attribute :fecha, :datetime
end
