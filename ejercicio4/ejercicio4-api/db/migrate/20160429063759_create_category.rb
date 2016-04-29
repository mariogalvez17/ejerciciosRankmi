class CreateCategory < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.text :nombre
      t.text :descripcion
      t.float :valor
      t.references :padre, index: true, foreign_key: true

      t.timestamps null: false
    end
     execute <<-SQL
      ALTER TABLE service_applications
        ALTER column created_at  set DEFAULT CURRENT_TIMESTAMP,
        ALTER column updated_at  set DEFAULT CURRENT_TIMESTAMP,
  end
end
