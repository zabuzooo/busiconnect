class TypesController < ApplicationController
  before_action :authenticate_user!
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
end
