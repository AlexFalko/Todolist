class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
     
      t.string :name
      t.boolean :status
      t.datetime :date_end
      t.references :todolist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
