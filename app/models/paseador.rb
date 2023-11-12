class Paseador < ApplicationRecord
  validates_uniqueness_of :email, message: "Ya existe un cuidador con este email."
end
