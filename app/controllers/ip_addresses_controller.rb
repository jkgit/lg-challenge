class IpAddressesController < ApplicationController
  active_scaffold :"ip_address" do |conf|
  end
  
  # Endpoint to add a list of ip-addresses passed in as a json array
  def add
    IpAddress.add params[:_json]
    
    render :status => 200, :layout=>false
  end
  
  # Endpoint to get an ip-address, returns the address if it exists or a 500 status if
  # it doesn't exist
  def get
    ip_address = IpAddress.find_by_ipv4(params[:ipv4_address])
    
    if (ip_address!=nil)
      render :text => ip_address.ipv4
    else
      render :status => 500, :layout=>false
    end
  end
  
  # Endpoint to get an array of ip-addresses as a json object
  def get_all
    render :json => IpAddress.all_ipv4_addresses.to_json
  end
  
  # Endpoint to delete all ip-addresses
  def delete_all
    IpAddress.delete_all
    
    render :status => 200, :layout=>false
  end
end
