# frozen_string_literal: true
class Reservation < ApplicationRecord
  #---------- Associations
	belongs_to :customer
  belongs_to :salon_service

  #-----------Validations
	validates :start_time, :duration, :price, presence: true
  validates :salon_service_id, uniqueness: { scope: [:customer_id,  :start_time]}
	validate :valid_start_time

  #---------- Callbacks
  before_validation :set_defaults, on: :create


  def set_defaults
		self.duration = salon_service.duration
		self.price = salon_service.price
  end

	def valid_start_time
		if (start_time.today? || start_time.to_f%30.minutes == 0)
			available_slots = FetchSlots.new({salon_service: salon_service}).list
			errors.add(:base, :slot_already_booked) unless available_slots.include?(start_time)
		else
			errors.add(:start_time, :invalid_start_time) 
		end

	end
end
