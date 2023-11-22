class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :email, uniqueness: true

   has_many :turnos
   has_many :mensajes
  validates :name,presence: true
  validates:address,presence: true
   validates:phone_number, presence: true
  has_many :perros
  accepts_nested_attributes_for :perros
  has_many :perdidos
  has_many :encontrados
  has_many :adopcions
  has_many :turnos
  has_many :mensajes
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  enum role: [:user,:admin ]
  after_initialize :set_default_role, :if => :new_record?
  def set_default_role
    self.role ||= :user
  end

end
