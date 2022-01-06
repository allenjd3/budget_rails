class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :name
      t.belongs_to :item, null: false, foreign_key: true
      t.monetize :spent
      t.date :spent_date

      t.timestamps
    end
  end
end
