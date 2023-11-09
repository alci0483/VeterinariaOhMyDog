class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :perdidos
  has_many :encontrados
  has_many :adopcions
  

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:user,:admin ]
  after_initialize :set_default_role, :if => :new_record?
  def set_default_role
    self.role ||= :user
  end

end
