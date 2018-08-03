class PurposesController < ApplicationController
	before_action :sing_in_check
  def show
  	@search = Need.ransack(params[:q])
  	@types = Type.all
  	@place_fields = PlaceField.all
  	@purposes = Purpose.all
  	@purpose = Purpose.find(params[:id])
  	@need = Need.where(purpose_id: @purpose, delete_flag: false)
  	@needs = @need.page(params[:page]).per(8)
  end
  private
    def sing_in_check
      unless user_signed_in? || admin_signed_in?
        redirect_to introduction_path
      end
    end
end
