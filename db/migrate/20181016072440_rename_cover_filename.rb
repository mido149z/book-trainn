class RenameCoverFilename < ActiveRecord::Migration[5.2]
  def change
  	rename_column :books, cover_filename, cover 
  end
end
