class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.references :database
      t.string :name
      t.string :revision
      t.text   :data
      t.timestamps
    end
  end

  def self.down
    drop_table :documents
  end
end
