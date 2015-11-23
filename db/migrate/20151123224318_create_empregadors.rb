class CreateEmpregadors < ActiveRecord::Migration
  def change
    create_table :empregadors do |t|
      t.string :nome
      t.string :endereco
      t.string :numero

      t.timestamps null: false
    end
  end
end
