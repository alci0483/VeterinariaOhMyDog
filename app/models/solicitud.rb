class Solicitud < ApplicationRecord
  validates :nombre, presence: true
  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
  validates :mensaje, presence: true
  belongs_to :user
end
