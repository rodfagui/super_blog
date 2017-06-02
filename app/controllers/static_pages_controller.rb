class StaticPagesController < ApplicationController
  def home
  	@micropost = current_user.microposts.build if logged_in?
  	@all_microposts = Micropost.all.paginate(page: params[:page])
  end
end
