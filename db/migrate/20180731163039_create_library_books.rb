class CreateLibraryBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :library_books do |t|
      t.string :name
      t.integer :author_id
      t.text :lead
      t.boolean :is_active
      t.string :aasm_state

      t.timestamps
    end
  end
end
