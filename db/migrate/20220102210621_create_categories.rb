class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.belongs_to :month, null: false, foreign_key: true

      t.timestamps
    end
  end
end
