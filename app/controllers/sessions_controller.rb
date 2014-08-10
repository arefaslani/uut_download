class SessionsController < ApplicationController
  def new
    
  end

  def create
    @user = User.find_by(student_number: session_params[:student_number])
    if @user && @user.authenticate(session_params[:password])
      sign_in @user
      redirect_to @user
    else
      flash.now[:danger] = "There is no such user."
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:student_number, :password)
  end
end