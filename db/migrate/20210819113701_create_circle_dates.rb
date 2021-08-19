class CreateCircleDates < ActiveRecord::Migration[5.2]
  def change
    create_table :circle_dates do |t|
      t.date :date

      t.timestamps
    end
  end
end
