class SessionsController < ApplicationController
  include SessionsHelper

  def new
    
  end

  def create
    @user = User.find_by!(student_number: session_params[:student_number])
    if @user && @user.authenticate(session_params[:password])
      sign_in @user
      redirect_to controller: 'users', action: 'show', student_number: @user.student_number
    else
      flash.now[:danger] = "There is no such user."
      render :new
    end
  end

  def session_params
    params.require(:session).permit(:student_number, :password)
  end
end