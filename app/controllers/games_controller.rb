class GamesController < ApplicationController
  def index
    @coords = BoardSquare.all
  end
end