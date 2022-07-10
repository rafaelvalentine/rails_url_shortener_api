class ShortenersController < ApplicationController
  before_action :set_shortener, only: [:show, :update, :destroy]

  # GET /shorteners
  def index
    @shorteners = Shortener.all

    json_response data: @shorteners
  end

  # GET /shorteners/1
  def show
    json_response data: @shortener
  end

  # POST /shorteners
  def create
    @shortener.shortcode = Shortener.generate_shortcode if params[:shortcode].nil?
    @shortener = Shortener.new(shortener_params)

    if @shortener.save
      json_response data: @shortener, status: :created, location: @shortener
    else
      json_response data: @shortener.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shorteners/1
  def update
    if @shortener.update(shortener_params)
      json_response data: @shortener
    else
      json_response data: @shortener.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shorteners/1
  def destroy
    @shortener.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_shortener
    @shortener = Shortener.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def shortener_params
    params.fetch(:data, {})
  end
end
