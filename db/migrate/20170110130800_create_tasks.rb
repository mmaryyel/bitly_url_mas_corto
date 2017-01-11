class CreateTasks < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :long_url
      t.string :short_url
      t.integer :click_count, default:0
    end
  end
end
