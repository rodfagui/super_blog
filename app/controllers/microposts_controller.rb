class MicropostsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy, :edit, :update]
  before_action :correct_user,   only: [:destroy, :edit, :update]
  
  def show
    @micropost = Micropost.find(params[:id])
  end
  
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Post created!"
      redirect_to root_url
    else
      @all_microposts = []
      render 'static_pages/home'
    end
  end

  def edit
    @micropost = Micropost.find(params[:id])
  end

  def update
    @micropost = Micropost.find(params[:id])
    if @micropost.update(micropost_params)
      flash[:success] = "Post sucessfully modified!"
      redirect_to root_url
    else
      render :edit
    end
  end

	def destroy
    @micropost.destroy
    flash[:success] = "Post deleted"
    if params[:from]=='list'
      redirect_to :back
    else
      redirect_to @micropost.user
    end 
  end

	private
	  def micropost_params
	    params.require(:micropost).permit(:title, :content)
	  end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
