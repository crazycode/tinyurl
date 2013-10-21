class CreateShorts < ActiveRecord::Migration
  def self.up
  	create_table :shorts do |short|
  		short.string :long_url
  	end
  end

  def self.down
  	drop_table :shorts
  end
end
