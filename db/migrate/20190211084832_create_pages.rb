class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.string :title
      t.string :note
      t.date :op_start
      t.date :op_expection
      t.date :op_finished
      t.string :priority
      t.string :status
      
      t.timestamps
    end
  end
end
