class SalonSerializer < ActiveModel::Serializer
  include DatesAndTimes
    attributes :slug, :name, :open, :close, :address
  
    def open
      custom_time_format(object.start_time)
    end

    def close
      custom_time_format(object.end_time)
    end
end
  