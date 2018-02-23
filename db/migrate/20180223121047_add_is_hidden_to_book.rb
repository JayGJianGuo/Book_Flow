class AddIsHiddenToBook < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :is_hidden, :boolean, default: true
  end
end
