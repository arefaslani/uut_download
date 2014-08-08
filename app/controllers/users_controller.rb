class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    begin
      @user.save!
      sign_in @user
      flash[:success] = "Welcome user!"
      redirect_to action: 'show', student_number: @user.student_number
    rescue
      flash.now[:danger] = "The data you have passed are incorrect"
      render 'new'
    end
  end

  def show
    @user = User.find_by(student_number: params[:student_number])
  end

  private

  def user_params
    parameters = params.require(:user).permit(:student_number, :email, :password, :password_confirmation)
    parameters[:email] = parameters[:email].downcase
    return parameters
  end
end