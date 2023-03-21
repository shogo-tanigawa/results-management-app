class GamesController < ApplicationController
  
  def index
    @games = Game.all
    game = Game.find_by(id: params[:id])
  end

  def show
    @game = Game.find(params[:id])
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
    if @game.update_attributes(game_params)
      flash[:success] = "試合結果を更新しました。"
      redirect_to @game
    else
      render :edit
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    flash[:success] = "#{@game.game_day}の#{@game.opponent}戦のデータを削除しました。"
    redirect_to games_url
  end

  private

    def game_params
      params.require(:game).permit(:game_day, :stadium, :tournament, :opponent, :started_at, :finished_at, :batting_fielding, :result, :my_score, :opponent_score)
    end

    def set_game
      @game = Game.find(params[:id])
    end
end
