class TypesController < ApplicationController
  def show
  	@type = Type.find(params[:id])
  	@users = User.where(type_id: @type, delete_flag: false)
  	@needs = Need.where(user_id: @users, delete_flag: false)
  	@page_needs = @needs.page(params[:page]).reverse_order
  	@search = Need.ransack(params[:q])
  	@types = Type.all
  	@place_fields = Place_field.all
  end
end
