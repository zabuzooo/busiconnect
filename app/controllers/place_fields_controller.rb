class PlaceFieldsController < ApplicationController
	before_action :sing_in_check
  def show
  	@search = Need.ransack(params[:q])
  	@types = Type.all
  	@place_fields = PlaceField.all
  	@purposes = Purpose.all
  	@place_field = PlaceField.find(params[:id])
  	@need = Need.where(place_field_id: @place_field, delete_flag: false)
  	@needs = @need.page(params[:page]).per(8)
    @under_needs = Need.where(delete_flag: false)
  end
  private
    def sing_in_check
      unless user_signed_in? || admin_signed_in?
        redirect_to introduction_path
      end
    end
end
