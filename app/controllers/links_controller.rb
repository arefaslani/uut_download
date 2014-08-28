class LinksController < ApplicationController
  before_filter :check_signed_in
  
  def new
    @link = current_user.links.new
  end
end