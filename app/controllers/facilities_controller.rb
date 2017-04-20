class FacilitiesController < ApplicationController
  before_action :set_facility, only: [:show, :edit, :update, :destroy]
  before_action :set_current_user

  # GET /facilities
  # GET /facilities.json
  def index
    @facilities = Facility.where(user: current_user)
  end

  def search

    @facilities = Facility.near(params[:address], 5000)

    @hash = Gmaps4rails.build_markers(@facilities) do |facility, marker|
      marker.lat facility.latitude
      marker.lng facility.longitude
      marker.picture({
                        :url    => ActionController::Base.helpers.asset_url("beer_icon2.png"),
                        :width  => "42",
                        :height => "42",

                       })
      # marker.infowindow('<h3><%= facility.name %></h3><p><%= facility.description %><p>')
      marker.infowindow render_to_string(partial: "/facilities/map_box", locals: { facility: facility })
    end
  end
  # GET /facilities/1
  # GET /facilities/1.json
  def show
    @booking = Booking.new
    @booking.facility = @facility
    @booking.user = current_user
    @booked_dates = Facility.find(params[:id]).booked_dates
  end

  # GET /facilities/new
  def new
    @facility = Facility.new
  end

  # GET /facilities/1/edit
  def edit
  end

  # POST /facilities
  # POST /facilities.json
  def create
    @facility = Facility.new(facility_params)
    @facility.user = current_user

    respond_to do |format|
      if @facility.save
        format.html { redirect_to @facility, notice: 'Facility was successfully created.' }
        format.json { render :show, status: :created, location: @facility }
      else
        format.html { render :new }
        format.json { render json: @facility.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facilities/1
  # PATCH/PUT /facilities/1.json
  def update
    respond_to do |format|
      if @facility.update(facility_params)
        format.html { redirect_to @facility, notice: 'Facility was successfully updated.' }
        format.json { render :show, status: :ok, location: @facility }
      else
        format.html { render :edit }
        format.json { render json: @facility.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facilities/1
  # DELETE /facilities/1.json
  def destroy
    @facility.destroy
    respond_to do |format|
      format.html { redirect_to facilities_url, notice: 'Facility was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_facility
      @facility = Facility.find(params[:id])
    end

    # UserID
    def set_current_user
      @current_user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def facility_params
      params.require(:facility).permit(:name, :description, :equipments_description, :producing_capability, :address, :user_id, photos:[])
    end
end
