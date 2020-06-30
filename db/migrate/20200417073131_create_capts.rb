# frozen_string_literal: true

# rubocop:todo Style/Documentation
class CreateCapts < ActiveRecord::Migration[6.0]
  def change
    create_table :capts do |t|
      t.text :capt

      t.timestamps
    end
  end
end
# rubocop:enable Style/Documentation
