class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :reviews, :wishlists, :user_locations]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def possible_delivers
    @possible_delivers = []

    location_from = Location.where("city_name LIKE ?", "%#{filter[:coming_from].downcase}%").limit(1).first
    location_to = Location.where("city_name LIKE ?", "%#{filter[:going_to].downcase}%").limit(1).first

    if location_from && location_to
      users = User.where(location_id: [location_from.id, location_to.id]).to_a
      @possible_delivers = users.inject([]) {|arr, user| arr << user if user.has_plan_with?([location_from.id, location_to.id]); arr }
    end
    render json: User.all
  end

  def wishlists_of
    location_from = Location.where("city_name LIKE ?", "%#{filter[:want_something_from].downcase}%").limit(1).first

    if location_from
      user_ids = Wishlist.where(location_id: location_from.id).map(&:user_id)
      @users = User.where(id: user_ids).to_a
    end
  end

  def reviews
    @reviews = @user.reviews_as_reviewee
  end

  def wishlists
    @wishlists = @user.wishlists
  end

  def user_locations
    @user_locations = @user.user_locations
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user)
            .permit(
              :instragram_url,
              :pintrest_url,
              :tag_line,
              :full_name,
              :email,
              :password,
              :password_confirmation
            )
    end

    def filter
      params[:filter] || {}
    end
end
