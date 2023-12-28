class RentalsController < ApplicationController
  before_action :find_rental, except: %i[index new create]
  before_action :authenticate_user!, except: [:show]
  before_action :is_authorized, only: %i[listing pricing description photo_upload amenities location update]

  def index
    # @rentals = current_user.rooms
    @rentals = Rentals.all
  end

  def new
    @rental = current_user.rentals.build
  end

  def create
    @rental = current_user.rentals.build(rental_params)
    if @rental.save!
      redirect_to listing_rental_path(@rental), notice: "Saved..."
    else
      flash[:alert] = "Something went wrong..."
      render :new
    end
  end

  def show
  end

  def listing
  end

  def pricing
  end

  def description
  end

  def photo_upload
    @photos = @rental.images
  end

  def amenities
  end

  def location
  end

  def update
    if @rental.update!(rental_params)
      flash[:notice] = "Saved"
    else
      flash[:alert] = "Something went wrong"
    end
    redirect_back(fallback_location: request.referer)
  end

  private

  def find_rental
    @rental = Rental.find(params[:id])
  end

  def is_authorized
    redirect_to root_path, alert: "You don't have permission" unless current_user.id == @rental.user_id
  end

  def rental_params
    params.require(:rental).permit(:home_type,
                                   :rental_type,
                                   :accommodate,
                                   :bedroom,
                                   :bathroom,
                                   :listing_name,
                                   :summary,
                                   :address,
                                   :tv,
                                   :kitchen,
                                   :ac,
                                   :heat,
                                   :internet,
                                   :price,
                                   :active)
  end
end
