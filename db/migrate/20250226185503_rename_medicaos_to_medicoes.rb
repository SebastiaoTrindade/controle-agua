class RenameMedicaosToMedicoes < ActiveRecord::Migration[5.2]
  def change
    rename_table :medicaos, :medicoes
  end
end

