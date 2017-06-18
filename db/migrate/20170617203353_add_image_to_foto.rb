class AddImageToFoto < ActiveRecord::Migration
  def change
    add_column :fotos, :image, :string
  end
end
