# frozen_string_literal: true

class CreateShortlinks < ActiveRecord::Migration[6.1]
  def up
    create_table :shortlinks do |t|
      t.string :title, null: false
      t.string :destination, null: false
      t.string :back_half, null: false
      t.boolean :deleted, null: false, default: false

      t.timestamps
    end
  end

  def down
    drop_table :shortlinks
  end
end
