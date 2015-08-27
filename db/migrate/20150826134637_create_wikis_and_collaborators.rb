class CreateWikisAndCollaboratorsAndCommets < ActiveRecord::Migration
  def change
    create_table :wikis do |t|
      t.string :title
      t.text :body
      t.boolean :private, default: false
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end

    create_table :collaborators do |t|
      t.string :name
      t.timestamps
    end

    create_table :comments do |t|
      t.references :wiki_id
      t.references :collaborator_id
      t.timestamps
    end

    add_index :wikis, :id, unique: true
    add_index :collaborators, :id, unique: true
    add_index :comments, :id, unique: true
    add_index :comments, :wiki_id
    add_index :comments, :collaborator_id
  end
end
