class UsersController < ApplicationController
  before_action :set_user, only:[:show, :favorites]
  def show
  end

  def favorites
    @favorites_pictures = @user.favorite_picture
  end

  private
    def set_user
      @user = User.find_by(id: params[:id])
    end

end
