class Movie < ApplicationRecord
  has_many :assistants, dependent: :destroy # Acá iniciamos el mucho a muchos con through
  has_many :user, through: :assistants
end