class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.date :time
      t.integer :category_id
      t.timestamps
    end
  end
end
