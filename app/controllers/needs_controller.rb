class NeedsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index, :show, :edit, :update, :search, :destroy]
  def new
    @need = Need.new
    @place_field = PlaceField.all
    @purpose = Purpose.all
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
    @delete_flag_needs = Need.where(delete_flag: false)
    @needs = @delete_flag_needs.page(params[:page]).per(8)
    @types = Type.all
    @place_fields = PlaceField.all
    @purposes = Purpose.all
    @search = Need.ransack(params[:q])
  end

  def show
    @need = Need.find(params[:id])
    @mt = @need.matchings
    # ↓はマッチング申請を同ユーザーが複数できなくするもの、実装するべきか悩む。一度しか登録できないのはどうなんだろう
    # @search_current_user_mt = @mt.where(user_id: current_user.id)
  end

  def edit
    @need = Need.find(params[:id])
    @place_field = PlaceField.all
    @purpose = Purpose.all
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
    @search = Need.ransack(params[:q])
    @search_needs = @search.result
    @delete_flag_search = @search_needs.where(delete_flag: false)
    @needs = @delete_flag_search.page(params[:page]).per(8)
    @types = Type.all
    @place_fields = PlaceField.all
    @purposes = Purpose.all
  end

  def introduction
  end

  def destroy
    need = Need.find(params[:id])
    need.update(delete_flag: 'true')
    flash[:danger] = '商品を削除しました'
    redirect_to root_path
  end

  private
    def need_params
      params.require(:need).permit(:need_title, :need_text, :match_time, :place_field_id, :place, :user_id, :need_number, :purpose_id, :image)
    end
end
