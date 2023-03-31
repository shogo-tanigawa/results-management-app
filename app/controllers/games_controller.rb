class GamesController < ApplicationController
  include UsersHelper
  before_action :authenticate_user!
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  
  def index
    @games = Game.all
    game = Game.find_by(id: params[:id])
  end

  def show
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      flash[:success] = '試合結果を登録しました。'
      redirect_to @game
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @game.scorebook.present?
      if params[:game][:delete_file] == "1"
        @game.remove_scorebook!
        @game.scorebook = nil
      end
      if params[:game][:scorebook].present?
        @game.remove_scorebook!
        @game.scorebook = nil
        @game.scorebook = params[:game][:scorebook]
      end
      @game.save
    end
    if @game.update_attributes(game_params)
      flash[:success] = "試合結果を更新しました。"
      redirect_to @game
    else
      render :edit
    end
  end

  def destroy
    @game.remove_scorebook!
    @game.destroy
    flash[:success] = "#{@game.game_day}の#{@game.opponent}戦のデータを削除しました。"
    redirect_to games_url
  end

  def display_pdf
    @game = Game.find(params[:id])
    file_path = @game.scorebook.file.path
    send_file(file_path, type: 'application/pdf', disposition: 'inline')
  end
  

  private

    def game_params
      params.require(:game).permit(:game_day, :stadium, :tournament, :opponent, :started_at, :finished_at, 
                                   :batting_fielding, :result, :my_score, :opponent_score, :comment, :scorebook)
    end

    def set_game
      @game = Game.find(params[:id])
    end
end
