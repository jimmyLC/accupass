class AddEventCategoryship < ActiveRecord::Migration

  def change

    create_table :event_categoryships do |t|
      t.integer :event_id
      t.integer :category_id

      t.timestamps
    end

    remove_column :events, :category_id, :integer

  end

end
