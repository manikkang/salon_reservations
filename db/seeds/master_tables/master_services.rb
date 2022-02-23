services = ['Haircut', 'Shaving', 'Hair Wax']
MasterSalonService.create!(services.map { |service| { name: service } })