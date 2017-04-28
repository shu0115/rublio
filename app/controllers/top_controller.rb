class TopController < ApplicationController
  def index
    redirect_to my_library_path if current_user.present?
  end
end
