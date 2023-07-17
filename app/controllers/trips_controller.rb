class TripsController < ApplicationController
  before_action :set_trip, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new create ]

  # GET /trips or /trips.json
  def index
    @q = Trip.ransack(params[:q])
    @trips = @q.result 
  end

  # GET /trips/1 or /trips/1.json
  def show
  end

  # GET /trips/new
  def new
    @trip = current_user.trips.build
  end

  # GET /trips/1/edit
  def edit
  end

  # POST /trips or /trips.json
  def create
    @trip = current_user.trips.build(trip_params)

    respond_to do |format|
      if @trip.save
        format.html { redirect_to trip_url(@trip), notice: "Trip was successfully created." }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trips/1 or /trips/1.json
  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to trip_url(@trip), notice: "Trip was successfully updated." }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1 or /trips/1.json
  def destroy
    @trip.destroy

    respond_to do |format|
      format.html { redirect_to trips_url, notice: "Trip was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def join
    @trip = Trip.find(params[:id])
  
    if current_user == @trip.user
      redirect_to trips_path, notice: "You cannot join your own trip."
    elsif @trip.participants.include?(current_user.name)
      redirect_to trips_path, notice: "You are already a participant of this trip."
    elsif @trip.requested_participants.include?(current_user.name)
      redirect_to trips_path, notice: "You have already requested to join this trip."
    else
      @trip.requested_participants << current_user.name
      @trip.save
      redirect_to trips_path, notice: "You have requested to join this trip."
    end
  end

  def manage_requests
    @trip = Trip.find(params[:id])
    @requested_participants = @trip.requested_participants
  end

  def accept_request
    @trip = Trip.find(params[:id])
    participant = params[:participant]
  
    if @trip.user == current_user && @trip.requested_participants.include?(participant)
      @trip.participants << participant
      @trip.requested_participants.delete(participant)
      @trip.save
  
      redirect_to manage_requests_trip_path(@trip), notice: "#{participant} has been accepted as a participant."
    else
      redirect_to manage_requests_trip_path(@trip), alert: "Invalid request."
    end
  end
  
  def reject_request
    @trip = Trip.find(params[:id])
    participant = params[:participant]
  
    if @trip.user == current_user && @trip.requested_participants.include?(participant)
      @trip.requested_participants.delete(participant)
      @trip.save
  
      redirect_to manage_requests_trip_path(@trip), notice: "#{participant} has been rejected as a participant."
    else
      redirect_to manage_requests_trip_path(@trip), alert: "Invalid request."
    end
  end
  
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trip_params
      params.require(:trip).permit(:departure_location, :arrival_location, :departure_date, :arrival_date, :departure_time, :arrival_time, :trip_type, :user_id)
    end
end
