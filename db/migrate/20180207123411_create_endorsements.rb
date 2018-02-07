class CreateEndorsements < ActiveRecord::Migration[5.1]
  def change
    create_table :endorsements do |t|
      t.references :skill, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
