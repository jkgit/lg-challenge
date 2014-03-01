# spec/models/ip_address_spec.rb
require 'spec_helper'

describe IpAddress do
  setup do
    IpAddress.delete_all
  end
  
  it "adds an array of ipv4 addresses without duplicates" do
    IpAddress.add ["1.2.3.4", "2.3.4.5", "2.3.4.5"]
    expect(IpAddress.all.length).to eq 2
  end
  
  it "retrieves an ipv4 address" do
    IpAddress.add ["1.2.3.4", "2.3.4.5", "3.4.5.6"]
    
    test_address = IpAddress.find_by_ipv4("1.2.3.4")
    expect(test_address.ipv4).to eq "1.2.3.4"
  end
  
  it "returns an array of all ipv4 addresses" do
    # should use factory girl or some better method to test addition of addresses,
    # but for now this will suffice.  assumes that the add method works.
    IpAddress.add ["1.2.3.4", "2.3.4.5", "3.4.5.6"]
    
    ip_addresses=IpAddress.all_ipv4_addresses
    expect(ip_addresses.length).to eq 3
    expect(ip_addresses[0]).to eq "1.2.3.4"
  end
end