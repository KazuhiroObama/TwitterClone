class AddForeignKeyToBlogsUserId < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :blogs, :users
  end
end
