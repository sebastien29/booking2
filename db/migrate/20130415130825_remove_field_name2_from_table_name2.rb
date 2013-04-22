class RemoveFieldName2FromTableName2 < ActiveRecord::Migration
  def up
    remove_column :livraisons, :vehicule_id
  end

  def down
    add_column :livraisons, :vehicule_id, :integer
  end
end
