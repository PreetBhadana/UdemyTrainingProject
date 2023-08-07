class Api::V1::UserController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: { business: "Haha" }, status: 200
  end

  def user_info
    @user = User.find_by(id: paramable[:id])
    
    if @user.nil?
      render json: { error: "Invalid id"}, status: 201
    else
      # render json: { user: @user }, status: 200
      
      render json: { user: UserSerializer.new(@user, root: false) }, status: 200
      
    end
  end

  private

  def paramable
    params.require(:user).permit(:id)
  end

end