class StaticPagesController < ApplicationController
  def home
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.page(params[:page]).per(10)
  end

  def help
  end

  def about
  end

  def contact
  end
end
