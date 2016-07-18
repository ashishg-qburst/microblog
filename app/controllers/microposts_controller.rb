class MicropostsController < ApplicationController
  before_action :user_signed_in?, only: [:create, :destroy]

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Post Successful"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @micropost = Micropost.find(params[:id])
    @micropost.destroy
    flash[:success] = "Post Deleted."
    redirect_to request.referrer || root_url
  end

  private
    def micropost_params
      params.require(:micropost).permit(:content, :picture)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end


end
