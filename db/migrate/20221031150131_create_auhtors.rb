class CreateAuhtors < ActiveRecord::Migration[7.0]
  def change
    create_table :auhtors do |t|
      t.string :first_name
      t.string :last_name
      t.string :homepage

      t.timestamps
    end
  end
end
