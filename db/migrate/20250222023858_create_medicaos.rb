class CreateMedicaos < ActiveRecord::Migration[5.2]
  def change
    create_table :medicaos do |t|
      t.references :user, foreign_key: true
      t.date :data
      t.decimal :medicao_manha
      t.decimal :medicao_tarde
      t.decimal :consumo_total

      t.timestamps
    end
  end
end
