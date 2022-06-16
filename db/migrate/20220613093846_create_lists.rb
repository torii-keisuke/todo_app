class CreateLists < ActiveRecord::Migration[7.0]
  def change
    create_table :lists do |t|
      t.string :content
      t.integer :board_id

      t.timestamps
    end
  end
end
