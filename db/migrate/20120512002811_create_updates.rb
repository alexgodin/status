class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.text :body
      t.integer :employee_id

      t.timestamps
    end
  end
end
