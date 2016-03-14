class Api::V1::UsersController < ApplicationController
	respond_to :json
	protect_from_forgery with: :null_session
	def show
		respond_with User.find(params[:id])
	end	
end
