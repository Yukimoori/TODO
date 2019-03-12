class CreateDailies < ActiveRecord::Migration[5.2]
  def change
    create_table :dailies do |t|
      t.date :date
      t.string :company_name
      t.integer :place, default:0
      t.integer :status, default:0
      t.integer :expectation, default:0
      t.string :comment
      t.integer :user_id
      t.timestamps
    end
  end
end
