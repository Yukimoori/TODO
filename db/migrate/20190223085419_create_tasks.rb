class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
    t.string :title
    t.string :note
    t.date :op_expection
    t.date :op_start
    t.date :op_finished
    t.string :priority
    t.string :status, default: "未着手"

    t.timestamps
  end
end
end
