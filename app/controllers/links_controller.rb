class LinksController < ApplicationController
  before_filter :check_signed_in
  
  def new
    @link = current_user.links.new
  end

  def create
    link = current_user.links.new(link_params)
    begin
      link.save!
      redirect_to current_user
    rescue
      flash[:danger] = "Error in saving link!"
      redirect_to current_user
    end
  end

  private

  def link_params
    params.require(:link).permit(:protocol, :address)
  end
end