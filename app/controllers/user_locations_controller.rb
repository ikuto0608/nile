class UserLocationsController < ApplicationController
  before_action :set_user_location, only: [:show, :edit, :update, :destroy]

  # GET /user_locations
  # GET /user_locations.json
  def index
    @user_locations = UserLocation.all
    @user_locations = @user_locations.where("end_time > ? and start_time < ?", filter[:due_time], filter[:due_time]) if filter[:due_time]
    @user_locations = @user_locations.where(user_id: filter[:user_id].to_i) if filter[:user_id]
    @user_locations = @user_locations.where(location_id: filter[:location_id].to_i) if filter[:location_id]
  end

  # GET /user_locations/1
  # GET /user_locations/1.json
  def show
  end

  # GET /user_locations/new
  def new
    @user_location = UserLocation.new
  end

  # GET /user_locations/1/edit
  def edit
  end

  # POST /user_locations
  # POST /user_locations.json
  def create
    @user_location = UserLocation.new(user_location_params)

    respond_to do |format|
      if @user_location.save
        format.html { redirect_to @user_location, notice: 'User location was successfully created.' }
        format.json { render :show, status: :created, location: @user_location }
      else
        format.html { render :new }
        format.json { render json: @user_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_locations/1
  # PATCH/PUT /user_locations/1.json
  def update
    respond_to do |format|
      if @user_location.update(user_location_params)
        format.html { redirect_to @user_location, notice: 'User location was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_location }
      else
        format.html { render :edit }
        format.json { render json: @user_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_locations/1
  # DELETE /user_locations/1.json
  def destroy
    @user_location.destroy
    respond_to do |format|
      format.html { redirect_to user_locations_url, notice: 'User location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_location
      @user_location = UserLocation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_location_params
      params.require(:user_location)
            .permit(
              :start_time,
              :end_time,
              :user_id,
              :location_id
            )
    end

    def filter
      params[:filter] || {}
    end
end
