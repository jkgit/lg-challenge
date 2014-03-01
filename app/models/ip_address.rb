class IpAddress < ActiveRecord::Base
  attr_accessible :ipv4
  
  # add an array of ip-addresses.  check if each ip-address exists before inserting to
  # avoid duplicates, assumes the list contains ipv4 addresses
  def self.add ip_addresses
    ip_addresses.each do |ipv4_address|
      existing_ip_address = IpAddress.find_by_ipv4(ipv4_address)
      if (existing_ip_address==nil)
        new_ip_address=IpAddress.new
        new_ip_address.ipv4=ipv4_address
        new_ip_address.save
      end
    end
  end
  
  # retrieve an array of all ipv4 addresses
  def self.all_ipv4_addresses
    IpAddress.all.collect{|a| a.ipv4}
  end
end
