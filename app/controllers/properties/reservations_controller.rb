# frozen_string_literal: true

module Properties
    class ReservationsController < ApplicationController
      
  
      def new
        @property = Property.find(params[:property_id])
        @reservation = @property.reservations.new
        @checkin_date = new_reservation_params[:checkin_date]
        @checkout_date = new_reservation_params[:checkout_date]
        @nights = new_reservation_params[:nights]
        @subtotal = new_reservation_params[:subtotal]
        @cleaning_fee = new_reservation_params[:cleaning_fee]
        @service_fee = new_reservation_params[:service_fee]
        @total = new_reservation_params[:total]
      end
  
      private
  
      def new_reservation_params
        params.permit(
          :checkin_date, :checkout_date, :nights, :subtotal, :cleaning_fee,
          :service_fee, :total
        )
      end
    end
  end