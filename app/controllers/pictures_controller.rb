class PicturesController < ApplicationController
  before_action :set_picture, only:[:show, :edit, :update, :destroy]
  def index
    @pictures = Picture.all
    @users = User.where.not(id: current_user.id)
  end

  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def new
    if params[:back]
      @picture = Picture.new(picture_params)
    else
      @picture = Picture.new
    end
  end

  def confirm
    @picture = Picture.new(picture_params)
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id

    if @picture.save
       NoticeMailer.notice_mail(@picture).deliver
      redirect_to pictures_path, notice: "Share new yourpost"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @picture.update(picture_params)
      redirect_to picture_path, notice:"更新しました"
    else
      render 'new'
    end
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path, notice:"削除しました"
  end

  private
    def picture_params
      params.require(:picture).permit(:content, :postimage, :postimage_cache)
    end

    def set_picture
      @picture = Picture.find(params[:id])
    end
end
