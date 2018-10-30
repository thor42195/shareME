class NoticetMailer < ApplicationMailer
  def notice_mail(blog)
     @picture = picture
     @user = @picture.user
     mail to: @user.email, subject: "画像投稿の確認メール"
  end
end
