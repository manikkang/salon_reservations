service_1_id = MasterSalonService.find_by(name: 'Haircut').id
service_2_id = MasterSalonService.find_by(name: 'Shaving').id
service_3_id = MasterSalonService.find_by(name: 'Hair Wax').id

salons_array = [
    {
        name: 'Salon A',
				gstin: '12345678AA',
				pan: 'DRDPK21312',
				start_time: '9:00',
				end_time: '23:00',
				chairs: 5,
				address: 'SCO: 343 Sector: 11, Panchkula, Haryana',
				owner_attributes: {
					name: 'Manik Kang',
					email: 'manikkang16@gmail.com'
				},
				services_attributes: [
					{
						service_id: service_1_id,
						duration: 20,
						price: 100
					},
					{
						service_id: service_2_id,
						duration: 20,
						price: 120
					},
					{
						service_id: service_3_id,
						duration: 20,
						price: 140
					}
				]
    },
		{
        name: 'Salon B',
				gstin: '12345679AA',
				pan: 'DRDPK21512',
				start_time: '9:00',
				end_time: '23:00',
				chairs: 4,
				address: 'SCO: 343 Sector: 12, Panchkula, Haryana',
				owner_attributes: {
					name: 'Manik',
					email: 'manikkang16+1@gmail.com'
				},
				services_attributes: [
					{
						service_id: service_1_id,
						duration: 120,
						price: 130
					},
					{
						service_id: service_2_id,
						duration: 60,
						price: 120
					},
					{
						service_id: service_3_id,
						duration: 120,
						price: 140
					}
				]
    }
]
salons = Salon.create!(salons_array)


customers_array = [
	{
		name: "Manik",
		email: "manikkang16+2@gmail.com"
	},
	{
		name: "Manik",
		email: "manikkang16+3@gmail.com"
	}
]
customers = Customer.create(customers_array)
salons.first(1).each do |salon|
	salon.services.first(1).each do |salon_service|
		customers.first(1).each do |customer|
			hour = rand(22...23)
			start_time = DateTime.now.change({hour: hour})
			Reservation.create!(salon_service_id: salon_service.id, customer_id: customer.id, price: salon_service.price, start_time: start_time, duration: salon_service.duration)
		end
	end
end