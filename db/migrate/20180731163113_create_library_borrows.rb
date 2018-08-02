class CreateLibraryBorrows < ActiveRecord::Migration[5.0]
  def change
    create_table :library_borrows do |t|
      t.integer :book_id
      t.integer :user_id
      t.datetime :borrow_date
      t.datetime :draw_date

      t.timestamps
    end
  end
end
