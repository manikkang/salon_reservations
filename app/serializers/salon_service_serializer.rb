class SalonServiceSerializer < ActiveModel::Serializer
    
	attributes :name, :price, :id
	
	def name
		object.service.name
	end
	
	def price
		ActionController::Base.helpers.number_to_currency(object.price, unit: 'INR') 
	end
end
    