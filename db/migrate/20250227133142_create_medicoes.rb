class CreateMedicoes < ActiveRecord::Migration[5.2]
  def change
    create_table :medicoes do |t|
      t.references :user, foreign_key: true
      t.date :data
      t.decimal :manha
      t.decimal :tarde
      t.decimal :consumo_total

      t.timestamps
    end
  end
end

