class PlaceFieldsController < ApplicationController
	before_action :authenticate_user!
  def show
  	@search = Need.ransack(params[:q])
  	@types = Type.all
  	@place_fields = PlaceField.all
  	@purposes = Purpose.all
  	@place_field = PlaceField.find(params[:id])
  	@need = Need.where(place_field_id: @place_field, delete_flag: false)
  	@needs = @need.page(params[:page]).per(8)
  end
end
