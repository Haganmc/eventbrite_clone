class RenamePostsToEvents < ActiveRecord::Migration[8.0]
  def change
    rename_table :posts, :events
  end
end
