class CreateIpAddresses < ActiveRecord::Migration
  def change
    create_table :ip_addresses do |t|
      t.string :ipv4

      t.timestamps
    end
  end
end
