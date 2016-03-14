class Api::V1::UsersController < ApplicationController
	respond_to :json
	protect_from_forgery with: :null_session
	def show
		respond_with User.find(params[:id])
	end	

	def create
		user = User.new(user_params)
		if user.save
			render :json => user, status: 201, location: [:api,user]
		else
			data = {
				errors: user.errors
			}
			render :json => data, status: 422
		end	
	end	

	private 
		def user_params
			params.require(:user).permit(:email,:password,:password_confirmation)
		end	
end
