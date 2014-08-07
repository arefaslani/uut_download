class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    begin
      @user.save!
      flash[:success] = "Welcome user!"
      redirect_to @user
    rescue
      flash.now[:danger] = "The data you have passed are incorrect"
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:student_number, :email, :password, :password_confirmation)
  end
end