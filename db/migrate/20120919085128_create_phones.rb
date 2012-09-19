class CreatePhones < ActiveRecord::Migration
  def change
  	drop_table "phones"
    create_table :phones do |t|

      t.timestamps
    end
  end
  def self.down
  	
  end
end
