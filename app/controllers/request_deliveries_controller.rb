class RequestDeliveriesController < ApplicationController
  before_action :set_request_delivery, only: [:show, :edit, :update, :destroy]

  # GET /request_deliveries
  # GET /request_deliveries.json
  def index
    @request_deliveries = RequestDelivery.all
  end

  # GET /request_deliveries/1
  # GET /request_deliveries/1.json
  def show
  end

  # GET /request_deliveries/new
  def new
    @request_delivery = RequestDelivery.new
  end

  # GET /request_deliveries/1/edit
  def edit
  end

  # POST /request_deliveries
  # POST /request_deliveries.json
  def create
    @request_delivery = RequestDelivery.new(request_delivery_params)

    respond_to do |format|
      if @request_delivery.save
        format.html { redirect_to @request_delivery, notice: 'Request delivery was successfully created.' }
        format.json { render :show, status: :created, location: @request_delivery }
      else
        format.html { render :new }
        format.json { render json: @request_delivery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /request_deliveries/1
  # PATCH/PUT /request_deliveries/1.json
  def update
    respond_to do |format|
      if @request_delivery.update(request_delivery_params)
        format.html { redirect_to @request_delivery, notice: 'Request delivery was successfully updated.' }
        format.json { render :show, status: :ok, location: @request_delivery }
      else
        format.html { render :edit }
        format.json { render json: @request_delivery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_deliveries/1
  # DELETE /request_deliveries/1.json
  def destroy
    @request_delivery.destroy
    respond_to do |format|
      format.html { redirect_to request_deliveries_url, notice: 'Request delivery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_delivery
      @request_delivery = RequestDelivery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_delivery_params
      params.require(:request_delivery)
            .permit(
              :product,
              :price,
              :message,
              :customer_id,
              :deliver_id,
              :wishlist_id
            )
    end
end
