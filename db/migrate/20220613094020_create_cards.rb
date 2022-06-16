class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.integer :content
      t.integer :list_id

      t.timestamps
    end
  end
end
