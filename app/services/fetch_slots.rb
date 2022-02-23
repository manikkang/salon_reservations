
class FetchSlots
	include Arrays
	include DatesAndTimes
  attr_accessor :salon_service, :salon

	def initialize(attrs = {})
		@salon_service = attrs[:salon_service]
		@salon = salon_service.salon
	end

	def list
		salon_slots = slots_in_range(salon.current_start_time, salon.current_end_time(salon_service.duration))
		bookings_slots = current_booking_slots
		final_slots = subtract_each_array_item(salon_slots, bookings_slots).uniq
		final_slots
	end

	private

	def current_booking_slots
		upcoming_bookings = Reservation.where(salon_service_id: salon_service.id, start_time: Time.current..(salon.current_end_time))
		reserved_slots = []
		upcoming_bookings.each do |booking|
			booking_period_start = ceil_to_30(booking.start_time - booking.duration)
			booking_period_end = floor_to_30(booking.start_time + booking.duration)
			reserved_slots << slots_in_range(booking_period_start, booking_period_end)
		end
		reserved_slots.flatten
	end


	def slots_in_range(start_time, end_time)
		return [] if Time.current > end_time
		slots = [start_time]
		while start_time < end_time
			start_time = start_time + 30.minutes
			slots << start_time
		end
    slots	
	end
end