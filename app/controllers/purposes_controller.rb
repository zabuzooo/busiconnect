class PurposesController < ApplicationController
	before_action :authenticate_user!
  def show
  	@search = Need.ransack(params[:q])
  	@types = Type.all
  	@place_fields = PlaceField.all
  	@purposes = Purpose.all
  	@purpose = Purpose.find(params[:id])
  	@need = Need.where(purpose_id: @purpose, delete_flag: false)
  	@needs = @need.page(params[:page]).per(8)
  end
end
