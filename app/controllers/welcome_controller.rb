class WelcomeController < ApplicationController
  def index
    flash[:notice] = "おはいよ"
  end
end
