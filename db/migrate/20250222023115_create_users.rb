class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nome
      t.string :email
      t.string :senha_digest
      t.string :foto

      t.timestamps
    end
  end
end
