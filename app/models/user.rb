class User < ApplicationRecord
    has_many :assistants, dependent: :destroy # Acá iniciamos el mucho a muchos con through
    accepts_nested_attributes_for :assistants
    has_many :movies, through: :assistants
  
    validates :username, presence: true
    validates :age, presence: true, length: { maximum: 2}
    validates :country, presence: true
    
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable
end
