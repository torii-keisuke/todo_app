class ChangeDataTaskToCards < ActiveRecord::Migration[7.0]
  def change
    change_column :cards, :task, :string
  end
end
