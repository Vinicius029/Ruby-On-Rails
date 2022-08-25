class WelcomeController < ApplicationController
  def index
    cookies[:curso] = "Ruby On Rails"
    @nome = params[:nome]
    @curso = params[:curso]
  end
end
