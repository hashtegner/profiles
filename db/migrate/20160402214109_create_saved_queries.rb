class CreateSavedQueries < ActiveRecord::Migration[5.0]
  def change
    create_table :saved_queries do |t|
      t.belongs_to :profile, null: false
      t.string :name, null: false
      t.jsonb :parameters, null: false, default: '{}'
      t.timestamps
    end

    add_foreign_key :saved_queries, :profiles
    add_index :saved_queries, [:profile_id, :name], unique: true
    add_index  :saved_queries, :parameters, using: :gin
  end
end
