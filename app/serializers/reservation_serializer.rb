class ReservationSerializer < ActiveModel::Serializer
	include DatesAndTimes
	attributes :price, :duration, :service_name, :start
    
	def start
		custom_date_time_format(object.start_time)
	end

	def price
		ActionController::Base.helpers.number_to_currency(object.price, unit: 'INR') 
	end

	def service_name
		object.salon_service.service.name
	end
end
    