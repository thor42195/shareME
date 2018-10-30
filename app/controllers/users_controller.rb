class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @favorites_pictures = @user.favorite_picture
  end
end
