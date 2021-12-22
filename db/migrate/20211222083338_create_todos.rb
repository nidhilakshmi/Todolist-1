class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.string :task
      t.text :description
      t.datetime :date

      t.timestamps
    end
  end
end
