class CurrentUserController < ApplicationController
  def edit_current_user
    @user = current_user
  end

  def update_current_user
    @user = User.find(current_user.id)
    if(!params[:user][:image].nil?)
      @user.update(first_name: user_params[:first_name], last_name: user_params[:last_name], age: user_params[:age], full_name: "#{user_params[:first_name]} #{user_params[:last_name]}", image: user_params[:image])
    else
      @user.update(first_name: user_params[:first_name], last_name: user_params[:last_name], age: user_params[:age], full_name: "#{user_params[:first_name]} #{user_params[:last_name]}")
    end
    # @user.update(full_name: "#{user_params[:first_name]} #{user_params[:last_name]}")
    if @user.save
      UserMailer.with(user: current_user).user_logedin.deliver_later
      redirect_to "/about", notice: "You Updated your details !!"
    else
      render :edit_current_user, alert: "Your details wasn't Updated !!"
    end
  end

  private

  def user_params
      params.require(:user).permit(:first_name, :last_name, :age, :image)
  end
end