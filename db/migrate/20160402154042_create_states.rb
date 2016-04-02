class CreateStates < ActiveRecord::Migration[5.0]
  def change
    create_table :states do |t|
      t.string :name, null: false
      t.timestamps
    end

    add_index :states, :name, unique: true
  end
end
