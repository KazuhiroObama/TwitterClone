class ChangeBlogs < ActiveRecord::Migration[5.1]
  def change
    change_table :blogs do |t|
      t.integer :user_id
    end
  end
end
