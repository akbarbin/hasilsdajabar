class RenameColumnWholesellerIdToPosts < ActiveRecord::Migration
  def up
    rename_column :posts, :wholesellerid, :wholeseller_id
  end

  def down
    rename_column :posts, :wholeseller_id, :wholesellerid
  end
end
