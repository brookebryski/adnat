class CreateOrganisations < ActiveRecord::Migration[6.1]
  def change
    create_table :organisations do |t|
      t.string :oid
      t.string :name
      t.integer :rate
      
      t.timestamps
    end
  end
end
