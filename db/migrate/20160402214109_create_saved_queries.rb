class CreateSavedQueries < ActiveRecord::Migration[5.0]
  def change
    create_table :saved_queries do |t|
      t.belongs_to :profile, null: false
      t.string :name, null: false
      t.text :parameters, null: false
      t.timestamps
    end

    add_foreign_key :saved_queries, :profiles
    add_index :saved_queries, [:profile_id, :name], unique: true
  end
end
