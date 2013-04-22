class CreateLivraisons < ActiveRecord::Migration
  def change
    create_table :livraisons do |t|
      t.datetime :date
      t.text :adresse

      t.timestamps
    end
  end
end
