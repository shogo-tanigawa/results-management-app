class AddScorebookToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :scorebook, :string
  end
end
