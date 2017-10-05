class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @micropost = current_user.microposts.build  # form_for 用
      @microposts = current_user.feed_microposts.order('created_at DESC').page(params[:page])
      @favorites = current_user.favorites.order('created_at DESC').page(params[:page])
      counts(current_user)
    end
  end
end