class UserMailer < ApplicationMailer
  def user_logedin
    @greeting = 'Hi'
    @user = params[:user]
    mail(
      from: 'preetbhadana5@zohomail.in',
      to: @user.email, 
      subject: "You loged in"
    )
  end
end
