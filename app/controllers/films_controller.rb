class FilmsController < ApplicationController
  include ActionController::MimeResponds

  def index
    films = Film.all
    # @random_data = Film.order("RANDOM()").first
    @random_data = films.shuffle.first

    respond_to do |format|
      format.html
      format.json { render json: @random_data }
      format.xml { render xml: @random_data }
    end
  end
end
