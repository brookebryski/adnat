class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :name
      t.string :email 
      t.string :password_digest
      t.belongs_to :organisation, null: false, foreign_key: true 
      t.timestamps
    end
  end
end
