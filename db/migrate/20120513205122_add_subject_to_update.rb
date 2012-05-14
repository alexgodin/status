class AddSubjectToUpdate < ActiveRecord::Migration
  def change
    add_column :updates, :subject, :string
  end
end
