class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.date :game_day
      t.string :stagium
      t.string :tournament
      t.string :opponent
      t.datetime :started_at
      t.datetime :finished_at
      t.string :batting_fielding
      t.string :result
      t.integer :score

      t.timestamps
    end
  end
end
