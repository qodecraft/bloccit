class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value
      t.references :post, index: true
      t.references :user

      t.timestamps
    end
  end
end
