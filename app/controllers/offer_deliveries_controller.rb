class OfferDeliveriesController < ApplicationController
  before_action :set_offer_delivery, only: [:show, :edit, :update, :destroy]

  # GET /offer_deliveries
  # GET /offer_deliveries.json
  def index
    @offer_deliveries = OfferDelivery.all
  end

  # GET /offer_deliveries/1
  # GET /offer_deliveries/1.json
  def show
  end

  # GET /offer_deliveries/new
  def new
    @offer_delivery = OfferDelivery.new
  end

  # GET /offer_deliveries/1/edit
  def edit
  end

  # POST /offer_deliveries
  # POST /offer_deliveries.json
  def create
    @offer_delivery = OfferDelivery.new(offer_delivery_params)

    respond_to do |format|
      if @offer_delivery.save
        format.html { redirect_to @offer_delivery, notice: 'Offer delivery was successfully created.' }
        format.json { render :show, status: :created, location: @offer_delivery }
      else
        format.html { render :new }
        format.json { render json: @offer_delivery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offer_deliveries/1
  # PATCH/PUT /offer_deliveries/1.json
  def update
    respond_to do |format|
      if @offer_delivery.update(offer_delivery_params)
        format.html { redirect_to @offer_delivery, notice: 'Offer delivery was successfully updated.' }
        format.json { render :show, status: :ok, location: @offer_delivery }
      else
        format.html { render :edit }
        format.json { render json: @offer_delivery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offer_deliveries/1
  # DELETE /offer_deliveries/1.json
  def destroy
    @offer_delivery.destroy
    respond_to do |format|
      format.html { redirect_to offer_deliveries_url, notice: 'Offer delivery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer_delivery
      @offer_delivery = OfferDelivery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_delivery_params
      params.require(:offer_delivery)
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
