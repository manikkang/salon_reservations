# frozen_string_literal: true
class Customer < ApplicationRecord

	#---------- Associations
	has_many :reservations, dependent: :destroy
	
	#-----------Validations
	validates :name, :email,  presence: true
	validates :email, uniqueness: { case_sensitive: false }
	
end
