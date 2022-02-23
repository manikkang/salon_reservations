# frozen_string_literal: true
class SalonService < ApplicationRecord
  
	#---------- Associations
	belongs_to :salon
	belongs_to :service, class_name: "MasterSalonService"

	#-----------Validations
	validates :duration, :price,  presence: true
	validates :service_id, uniqueness: { scope: :salon_id }
	validates :duration, numericality: { in: 1..180,  only_integer: true }
	validates :price, numericality: { in: 1..1000 }
end
