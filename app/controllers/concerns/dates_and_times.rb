module DatesAndTimes
    extend ActiveSupport::Concern
    include ActionView::Helpers::DateHelper
    

	def custom_date_format(date)
		date.strftime('%d/%m/%Y') 
	end

	def custom_time_format(time)
		time.strftime("%H:%M")
	end

    def custom_date_time_format(time)
        time.strftime('%F,%T')
    end

	def ceil_to_30(time)
		Time.at((time.to_f / 30.minutes).ceil * 30.minutes)
	end

	def floor_to_30(time)
		Time.at((time.to_f / 30.minutes).floor * 30.minutes)
	end
end    