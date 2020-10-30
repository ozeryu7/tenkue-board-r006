class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :postss do |t|
      t.timestamps
    end
  end
end
