class AddCoverFilenameToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :cover_filename, :string
  end
end
