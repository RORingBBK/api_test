class FilmsController < ApplicationController
  include ActionController::MimeResponds
  before_action :set_film, only: [:show, :update, :destroy]

  # GET /films
  # GET /films.json
  def index
    @films = Film.all

    respond_to do |format|
      format.html
      format.json { render json: @films }
      format.xml { render xml: @films }
    end
  end

  # GET /films/1
  # GET /films/1.json
  def show
    render json: @film
  end

  # POST /films
  # POST /films.json
  def create
    @film = Film.new(film_params)

    if @film.save
      render json: @film, status: :created, location: @film
    else
      render json: @film.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /films/1
  # PATCH/PUT /films/1.json
  def update
    @film = Film.find(params[:id])

    if @film.update(film_params)
      head :no_content
    else
      render json: @film.errors, status: :unprocessable_entity
    end
  end

  # DELETE /films/1
  # DELETE /films/1.json
  def destroy
    @film.destroy

    head :no_content
  end

  private

    def set_film
      @film = Film.find(params[:id])
    end

    def film_params
      params.require(:film).permit(:title, :year)
    end
end
