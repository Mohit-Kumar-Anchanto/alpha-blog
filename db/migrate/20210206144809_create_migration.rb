class CreateMigration < ActiveRecord::Migration[6.1]
  def change
    create_table :migrations do |t|
      t.string :title
      t.text :description
      t.timestamps
    end
  end
end


