class AddCommentToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :comment, :text
  end
end
