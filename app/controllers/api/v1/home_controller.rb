# frozen_string_literal: true
module Api
  module V1
    class HomeController < ApplicationController
      include DatesAndTimes

      def salons
        success_json('', { salons: ActiveModel::Serializer::CollectionSerializer.new(Salon.all, serializer: SalonSerializer).as_json}, :ok)
      end

      def salon_services
        salon = Salon.friendly.find(params[:slug])
        success_json('', { salons: ActiveModel::Serializer::CollectionSerializer.new(salon.services, serializer: SalonServiceSerializer).as_json}, :ok)
      end

      def list_slots
        salon_service = SalonService.find_by(id: params[:id])
        if salon_service.present?
          salon = salon_service.salon
          final_slots = FetchSlots.new({salon_service: salon_service}).list
          success_json('', { salon_name: salon.name,  service_name: salon_service.service.name, salon_service_id: salon_service.id, duration: salon_service.duration.to_s + ' Minutes', slots: final_slots.map{|s| custom_date_time_format(s)} }.as_json, :ok)
        else
          error_json(I18n.t('errors.messages.record_not_present', record: 'SalonService'), {}, :not_found)
        end
      end

      def reservation
        reservation = Reservation.new(reservation_params)
        if reservation.save
          success_json('', ReservationSerializer.new(reservation).serializable_hash, :ok)
        else
          error_json(reservation.errors.full_messages.to_sentence, {}, :unprocessable_entity)
        end
      end 


      private

      def reservation_params
        params.require(:reservation).permit(:customer_id, :salon_service_id, :start_time)
      end
    end 
  end     
end
