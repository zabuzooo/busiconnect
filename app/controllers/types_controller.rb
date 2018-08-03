class TypesController < ApplicationController
  before_action :sing_in_check
  def show
  	@type = Type.find(params[:id])
  	@users = User.where(type_id: @type, delete_flag: false)
  	@need = Need.where(user_id: @users, delete_flag: false)
  	@needs = @need.page(params[:page]).per(8)
  	@search = Need.ransack(params[:q])
  	@types = Type.all
  	@place_fields = PlaceField.all
  	@purposes = Purpose.all
  end

  private
    def sing_in_check
      unless user_signed_in? || admin_signed_in?
        redirect_to introduction_path
      end
    end
end
