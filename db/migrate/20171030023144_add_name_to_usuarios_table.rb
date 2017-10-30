class AddNameToUsuariosTable < ActiveRecord::Migration[5.1]
  def change
    add_column :usuarios, :name, :string
  end
end
