class UsersController < ApplicationController
	before_action :sing_in_check, only: [:completion, :edit, :update, :index, :show, :company]
	before_action :access_check, only: [:edit, :update, :show]
	before_action :admin_check, only: [:index]

	def completion
	end

	def use
	end

	def law
	end

	def forces
	end

	def agreement
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:notice] = "ユーザ情報を編集しました"
			redirect_to user_path(@user.id)
		else
			render "users/edit"
		end
	end

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@notifications = @user.notifications
		@unsubscribe_comment = UnsubscribeComment.find_by(user_id: params[:id])
		@need = Need.where(user_id: params[:id])
		@needs = @need.page(params[:page]).per(3)
		@matchings0 = @user.matchings.where(matching_s:0)
		@matchings1 = @user.matchings.where(matching_s:1)
		@matchings2 = @user.matchings.where(matching_s:2)
	end

	def company
		@user = User.find(params[:id])
	end

	private
		def user_params
			params.require(:user).permit(:user_name, :user_phonetic, :postal, :address, :place_field_id, :tell, :email, :pr, :anuual, :employment, :settlement_id, :type_id, :image)
		end

		def sing_in_check
			unless user_signed_in? || admin_signed_in?
				redirect_to introduction_path
			end
		end

		def access_check
	      unless admin_signed_in? || current_user.id == params[:id].to_i
	        redirect_to root_path
	      end
	    end

	    def admin_check
	    	unless admin_signed_in?
			redirect_to root_path
			end
		end
end
