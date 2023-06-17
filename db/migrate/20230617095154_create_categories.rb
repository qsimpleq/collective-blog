class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false, index: { unique: true, name: 'unique_name' }

      t.timestamps
    end
  end
end
