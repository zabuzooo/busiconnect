class UsersController < ApplicationController
	def completion
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
	end

	def show
		@user = User.find(params[:id])
		@unsubscribe_comment = UnsubscribeComment.find_by(user_id: params[:id])
		@needs = Need.where(user_id: params[:id])
	end

	private
		def user_params
			params.require(:user).permit(:user_name, :user_phonetic, :postal, :address, :place_field_id, :tell, :email)
		end
end
