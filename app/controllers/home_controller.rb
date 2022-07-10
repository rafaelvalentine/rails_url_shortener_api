class HomeController < ApplicationController
  def index
    render plain: "Welcome to my URL shortener"
  end
end
