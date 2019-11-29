class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :task
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
