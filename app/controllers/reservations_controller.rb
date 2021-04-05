class ReservationsController < ApplicationController
  before_action :require_logged_in_user
  before_action :set_reservation, only: %i[ show edit update destroy ]

  def index
    @reservation = Reservation.new
  end

  def load_events
    @reservations = Reservation.all 
  end

  def create
    @reservation = Reservation.new(reservation_params)

    respond_to do |format|
      if @reservation.save
        flash[:success] = 'Agendamento registrado com sucesso'
      else
        flash[:danger] = 'Ocorreu um erro ao atualizar o agendamento. Verifique se a data esta disponível, ou se encontra na semana atual ou posterior'        
      end      
      format.js
    end
  end

  def edit
    @reservations = Reservation.includes(:user).where(id: params[:id])
  end

  def update
    @reservation = Reservation.find params[:id]
    @new_reservation = Reservation.new(reservation_params)

    respond_to do |format|
      if @reservation.update(reservation_params)
        flash[:success] = 'Agendamento atualizado com sucesso'
      else
        flash[:danger] = 'Ocorreu um erro ao atualizar o agendamento. Verifique se a data esta disponível, ou se encontra na semana atual ou posterior'
      end    
      format.js { render js: 'window.top.location.reload(true);' }
    end
  end

  def destroy
    @reservation.destroy
    flash[:success] = 'Agendamento excluido com sucesso'
    render :index
  end

  private
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    def reservation_params
      params.require(:reservation).permit(:details, :date, :user_id)
    end
end
