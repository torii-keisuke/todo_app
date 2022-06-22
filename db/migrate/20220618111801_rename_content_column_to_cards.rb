class RenameContentColumnToCards < ActiveRecord::Migration[7.0]
  def change
    rename_column :cards, :content, :task
  end
end
