class ContactsController < ApplicationController
	before_action :access_guest
	before_action :access_admin, only: [:index, :show]
	before_action :access_user, only: [:new, :creare]
	def new
		@contact = Contact.new
	end

	def create
		contact = Contact.new(contact_params)
		contact.user_id = current_user.id
		 if contact.save
		redirect_to root_path
		flash[:success] = "問い合わせ情報を送信しました"
		else
		redirect_to new_contact_path
		flash[:danger] = "内容を記入してください。"
		end
	end

	def index
		@contacts = Contact.all.reverse_order
  	end

  	def show
  	end

	private
		def contact_params
			params.require(:contact).permit(:user_id, :content)
		end

		def access_guest
			unless user_signed_in? || admin_signed_in?
	 		redirect_to("/introduction")
	 		flash[:danger] = "問い合わせ機能を利用するにはログインが必要です"
			end
		end

		def access_admin
			unless admin_signed_in?
	 		redirect_to("/")
			end
		end

		def access_user
			if admin_signed_in?
	 		redirect_to("/")
	 		flash[:danger] = "管理者からの問い合わせ送信はできません"
			end
		end
end
