class GamesController < ApplicationController
  
  def index
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      flash[:success] = '試合結果を登録しました。'
      redirect_to games_url
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def game_params
      params.require(:game).permit(:game_day, :stadium, :tournament, :opponent, :started_at, :finished_at, :batting_fielding, :result, :score)
    end
end
