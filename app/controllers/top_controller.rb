class TopController < ApplicationController

  def index
    if user_signed_in?
      redirect_to '/topics'
    end
  end
end
