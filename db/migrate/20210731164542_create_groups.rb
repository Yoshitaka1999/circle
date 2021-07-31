class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :status
      t.integer :max
      t.date :date

      t.timestamps
    end
  end
end
