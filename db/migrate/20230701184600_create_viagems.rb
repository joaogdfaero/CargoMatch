class CreateViagems < ActiveRecord::Migration[7.0]
  def change
    create_table :viagems do |t|
      t.string :local_partida
      t.string :local_chegada
      t.date :data_partida
      t.date :data_chegada
      t.time :horario_partida
      t.time :horario_chegada
      t.string :tipo
      t.references :usuario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
