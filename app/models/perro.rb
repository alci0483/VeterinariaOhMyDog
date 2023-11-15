class Perro < ApplicationRecord
  belongs_to :user
  has_many :vacunacions
end
