# frozen_string_literal: true

class CreateSpendings < ActiveRecord::Migration[6.1]
  def change
    create_table :spendings do |t|
      t.string :name
      t.decimal :amount, precision: 5, scale: 2
      t.integer :user_id
      t.integer :group_id

      t.timestamps
    end
  end
end
