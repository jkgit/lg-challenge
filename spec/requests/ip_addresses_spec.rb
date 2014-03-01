require 'spec_helper'

describe 'ip address management' do
    setup do
      delete '/ip/all'
      expect(response.status).to eq 200
    end
    
    it "deletes a list of IP Addresses" do
      post '/ip/add', ["1.2.3.4", "2.3.4.5"].to_json, {'CONTENT_TYPE' => "application/json", 'ACCEPT' => 'application/json'}
      expect(response.status).to eq 200
      
      delete '/ip/all'
      expect(response.status).to eq 200
      
      get '/ip/all'
      expect(response.status).to eq 200
      
      body = JSON.parse(response.body)
      expect(body).to eq []
    end
    
    it "gets an IP Address" do
      get '/ip/get/1.2.3.4'
      expect(response.status).to eq 500
      
      post '/ip/add', ["1.2.3.4", "2.3.4.5"].to_json, {'CONTENT_TYPE' => "application/json", 'ACCEPT' => 'application/json'}
      expect(response.status).to eq 200
      
      get '/ip/get/1.2.3.4'
      expect(response.status).to eq 200
      expect(response.body).to eq "1.2.3.4"
    end
    
    it "adds a list of IP Addresses" do
      post '/ip/add', ["1.2.3.4", "2.3.4.5"].to_json, {'CONTENT_TYPE' => "application/json", 'ACCEPT' => 'application/json'}
      expect(response.status).to eq 200
      
      get '/ip/all'
      expect(response.status).to eq 200
      
      body = JSON.parse(response.body)
      expect(body).to eq ["1.2.3.4", "2.3.4.5"]
    end
end
