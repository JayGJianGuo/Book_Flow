class AddOtherInfoToBook < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :author, :string
    add_column :books, :publisher, :string
    add_column :books, :price, :string
    add_column :books, :isbn, :string
  end
end
