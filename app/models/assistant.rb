class Assistant < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  accepts_nested_attributes_for :user
end