class UsersController < ApplicationController
	include RowHelper

	def index
	end

	def show
	  @user = User.find_by(id:params[:id])
		@array = []
	  row_split(@user.albums)
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			redirect_to root_path
		else
			@errors = @user.errors.full_messages
			render :new
		end

	end

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
	end

end
