# frozen_string_literal: true
class SalonOwner < ApplicationRecord
  #---------- Associations
	belongs_to :salon
	
	#-----------Validations
	validates :name, :email,  presence: true
	validates :email, uniqueness: { case_sensitive: false }

end
