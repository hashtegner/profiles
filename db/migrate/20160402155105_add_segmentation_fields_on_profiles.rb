class AddSegmentationFieldsOnProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :state_id, :integer, null: false
    add_column :profiles, :age, :integer, null: false
    add_column :profiles, :title_position, :string, null: false

    # add_index :profiles, :state_id
    add_foreign_key :profiles, :states
  end
end
