class CreateFotos < ActiveRecord::Migration
  def change
    create_table :fotos do |t|
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
