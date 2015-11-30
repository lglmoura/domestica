class CreateEmpregados < ActiveRecord::Migration
  def change
    create_table :empregados do |t|
      t.string :nome
      t.string :endereco
      t.string :cidade
      t.references :empregador, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
