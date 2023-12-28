class PhotosController < ApplicationController
  def create
    @rental = Rental.find(params[:id])
    if params[:images]
      params[:images].each do |image|
        @rental.photos.create(image: image)
      end
      @photos = @rental.photos
      redirect_back(fallback_location: request.referer, notice: "Saved...")
    end
  end
end
