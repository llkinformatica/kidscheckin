class CreateCheckins < ActiveRecord::Migration[7.0]
  def change
    create_table :checkins do |t|
      t.string :nome
      t.date :nascimento
      t.text :observacoes
      t.string :uid
      t.integer :codigo
      t.boolean :checked

      t.timestamps
    end
  end
end
