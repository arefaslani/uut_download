class LinksController < ApplicationController
  def new
    @link = current_user.links.new
  end
end