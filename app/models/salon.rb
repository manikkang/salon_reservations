# frozen_string_literal: true
class Salon < ApplicationRecord
	include DatesAndTimes
  #---------- Friendly ID
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  #---------- Associations
	has_one :owner, class_name: "SalonOwner", dependent:  :destroy
	has_many :services, class_name: "SalonService", dependent:  :destroy
	has_many :reservations, through: :services

	#-----------Validations
	validates :name, :gstin, :pan, :start_time, :end_time, :chairs, :address,  presence: true
	validates :name, :gstin, :pan, uniqueness: { case_sensitive: false }
	validates :name, :gstin, :pan, length: { maximum: 255 }
	validates :chairs, numericality: { in: 1..100,  only_integer: true }
	validate :end_time_is_after_start_time


	#---------- Nested Attributes
	accepts_nested_attributes_for :owner, :services



	def current_start_time
		today_open_time =  start_time.change(year: Date.today.year, month: Date.today.month, day: Date.today.day)
		ceil_to_30(today_open_time < Time.current ? Time.current : today_open_time)
	end

	def current_end_time(service_duration=0)
		floor_to_30(end_time.change(year: Date.today.year, month: Date.today.month, day: Date.today.day) - service_duration.minutes)
	end


	private

	def end_time_is_after_start_time
		return if end_time.blank? || start_time.blank?
	
		if end_time < start_time
			errors.add(:end_time, :end_time_greater) 
		end 
	end

end
