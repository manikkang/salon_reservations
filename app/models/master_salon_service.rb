# frozen_string_literal: true
class MasterSalonService < ApplicationRecord
  
  #---------- Validations
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
