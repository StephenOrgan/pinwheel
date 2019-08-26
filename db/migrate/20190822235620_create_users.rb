class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users, id: :uuid do |t|
      t.string :email, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.boolean :admin, default: false
      t.string :password_digest, null: false
      t.references :account, type: :uuid
      t.timestamps
    end
  end
end
