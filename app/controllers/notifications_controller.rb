class NotificationsController < ApplicationController
	before_action :authenticate_user!
  def index
    @notifications = current_user.notifications
  end

  def link_through
  	@notification = Notification.find(params[:id])
    @notification.update read: true
    redirect_to need_path(@notification.need)
  end
end
