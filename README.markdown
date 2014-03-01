#Challenge

Write a program which stores a list of IP addresses. It should accept HTTP requests on port 9999 at three endpoints:

## POST /ip/add
The body of the POST will be a JSON encoded list of IP addresses (see below). Do not worry about proper error handling, you can assume the request is correctly formatted.

Your program should add each IP address to its list of IPs if that IP isn't already in the list. Otherwise, just ignore it and move on.

## GET /ip/get/<ip_address>
A request to /ip/get/1.2.3.4 should return "1.2.3.4" if that address is in the list of IP addresses, and return an HTTP 500 status code response otherwise.

## GET /ip/all
A request to /ip/all should return a JSON-encoded list of all the IP addresses currently in the program's list of IP addresses.

## DELETE /ip/all
A DELETE request to /ip/all should remove all IP addresses from the server's list

## Running application

	% rake db:migrate
    % rails server -p 9999
    
## Running Rails tests

Execute the following commands in your shell or command line (or IDE)

    % rake db:reset
    % rake db:test:load
    % rake test    
    % rake spec    

## Example JSON IP list

[
  "1.2.3.4",
  "4.5.6.7",
  "20.253.90.9"
]
