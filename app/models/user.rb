class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :email, uniqueness: true

  validates :name,presence: true
  validates:address,presence: true
   validates:phone_number, presence: true
  has_many :perros
  has_many :perdidos
  has_many :encontrados
  has_many :adopcions
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  enum role: [:user,:admin ]
  after_initialize :set_default_role, :if => :new_record?
  def set_default_role
    self.role ||= :user
  end

end
