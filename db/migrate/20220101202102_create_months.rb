class CreateMonths < ActiveRecord::Migration[7.0]
  def change
    create_table :months do |t|
      t.date :month
      t.integer :monthly_planned
      t.belongs_to :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
