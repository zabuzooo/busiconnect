class NeedsController < ApplicationController
  def new
    @need = Need.new
    @place_field = PlaceField.all
  end
  def create
       @need = Need.new(need_params)
       @need.user_id = current_user.id
       # binding.pry
      if @need.save
        @need.update(delete_flag: 'false')
        redirect_to root_path
        return
      else
        flash[:warning] = "入力されていない情報があります"
        @need = Need.new
        redirect_to new_need_path
        return
      end
  end
  def index
    @delete_flag_needs = Need.all
    @needs = @delete_flag_needs.where(delete_flag: false)
  end

  def show
    @need = Need.find(params[:id])
  end

  def edit
    @need = Need.find(params[:id])
    @place_field = PlaceField.all
  end

  def update
    @need = Need.find(params[:id])
    if @need.update(need_params)
      flash[:notice] = "ニーズ情報を編集しました"
      redirect_to need_path(@need.id)
    else
      redirect_to edit_need_path(@need.id)
    end
  end

  def search
  end

  def top
  end

  def destroy
    need = Need.find(params[:id])
    need.update(delete_flag: 'true')
    flash[:danger] = '商品を削除しました'
    redirect_to root_path
  end

  private
    def need_params
      params.require(:need).permit(:need_title, :need_text, :match_time, :place_field_id, :place, :user_id)
    end
end
