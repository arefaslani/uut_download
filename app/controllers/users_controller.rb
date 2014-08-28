class UsersController < ApplicationController
  before_filter :check_signed_in, except: [:new, :create]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    begin
      @user.save!
      sign_in @user
      flash[:success] = "Welcome user!"
      redirect_to @user
    rescue
      flash.now[:danger] = "The data you have passed are incorrect"
      render 'new'
    end
  end

  def edit
    @user = User.find_by(student_number: params[:student_number])
  end

  def update
    @user = current_user
    begin
      @user.update!(update_user_params)
      flash[:success] = "اطلاعات کاربری شما با موفقیت ویرایش شد."
      redirect_to @user
    rescue
      flash.now[:danger] = "مشکلی در ویرایش اطلاعات شما پیش آمده است."
      render :edit
    end
  end

  def show
    @user = User.find_by(student_number: params[:student_number])
    begin
      authorize! :read, @user
    rescue CanCan::AccessDenied => e
      flash[:warning] = e.message
      redirect_to root_path
    end
  end

  private

  def user_params
    parameters = params.require(:user).permit(:student_number, :email, :password, :password_confirmation)
    parameters[:email] = parameters[:email].downcase
    return parameters
  end

  def update_user_params
    user_params.permit(:email, :password, :password_confirmation)
  end
end