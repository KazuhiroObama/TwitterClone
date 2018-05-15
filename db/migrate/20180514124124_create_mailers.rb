class CreateMailers < ActiveRecord::Migration[5.1]
  def change
    create_table :mailers do |t|

      t.timestamps
    end
  end
end
