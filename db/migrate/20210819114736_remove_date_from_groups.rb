class RemoveDateFromGroups < ActiveRecord::Migration[5.2]
  def change
    remove_column :groups, :date, :date
    add_reference :groups, :circle_date, foreign_key: true
  end
end
