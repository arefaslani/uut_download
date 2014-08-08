class SessionsController < ApplicationController
  def new
    
  end

  def create
    begin
      @user = User.find_by(student_number: session_params[:student_number])
    rescue
      flash[:danger] = "Incorrect student number and password combination."
      render :new
    end
  end

  def session_params
    params.require(:session).permit(:student_number, :password)
  end
end