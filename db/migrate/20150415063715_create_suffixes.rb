class CreateSuffixes < ActiveRecord::Migration
  def change
    create_table :suffixes do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
