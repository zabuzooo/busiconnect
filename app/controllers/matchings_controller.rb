class MatchingsController < ApplicationController
  before_action :authenticate_user!,
  after_action :create_notifications, only: [:create]
  after_action :update_notifications, only: [:update]
  after_action :destroy_notifications, only: [:destroy]

   def create
    @need = Need.find(params[:id])
    need = Need.find(params[:id])
    rs = Matching.new(matching_params)
    rs.user_id = current_user.id
    rs.need_id = need.id
    rs.save
    redirect_to need_path
  end

  def update
    @mt = Matching.find(params[:id])
    @need = @mt.need
    @mt.update(matching_s:1)
    redirect_to need_path(@need)
  end

  def destroy
    @unmt = Matching.find(params[:id])
    @need = @unmt.need
    @unmt.update(matching_s:2)
    redirect_to need_path(@need)
  end
  private
    def matching_params
      params.require(:matching).permit(:matching_message)
    end

    def create_notifications
      return if @need.user.id == current_user.id
      Notification.create(user_id: @need.user.id, notified_by_id: current_user.id, need_id: @need.id, notified_type: 'マッチング申請')
    end

    def update_notifications
      Notification.create(user_id: @mt.user.id, notified_by_id: current_user.id, need_id: @need.id, notified_type: '申請の許可')
    end

    def destroy_notifications
      Notification.create(user_id: @unmt.user.id, notified_by_id: current_user.id, need_id: @need.id, notified_type: '申請の拒否')
    end
end
