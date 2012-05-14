class ChangeEmployeeToUser < ActiveRecord::Migration
  def up
    change_table :updates do |t|
      t.rename :employee_id, :user_id
    end
  end

  def down
  end
end
