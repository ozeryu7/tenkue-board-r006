class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :content
<<<<<<< HEAD
      t.references :user, foreign_key: true
=======
      # t.references :user, foreign_key: true
>>>>>>> parent of f5e6dd0... Merge branch 'origin/user.devise' into posts.create
      t.timestamps
    end
  end
end
