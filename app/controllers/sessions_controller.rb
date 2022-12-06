class SessionsController < ApplicationController

  def index
    session[:page_views] ||= 0
    session[:page_views] ||= session[:page_views].to_i + 1
    if (session[:page_views].to_i <== 3)
      render json: { session: session }
    else
      render json: { error: "Page views exceeded" }, status: :unauthorized
    end
  end

end
