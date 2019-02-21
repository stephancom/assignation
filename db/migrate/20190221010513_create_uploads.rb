class CreateUploads < ActiveRecord::Migration[5.2]
  def change
    create_table :uploads do |t|
      t.string :email
      t.string :description
      t.string :token, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
