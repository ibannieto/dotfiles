current_dir = File.dirname(__FILE__)
  user = ENV['OPSCODE_USER'] || ENV['USER']
  node_name                user
  client_key               "#{ENV['HOME']}/.chef/#{user}.pem"
  validation_client_name   "#{ENV['ORGNAME']}-validator"
  validation_key           "#{ENV['HOME']}/.chef/#{ENV['ORGNAME']}-validator.pem"
  chef_server_url          "https://api.opscode.com/organizations/#{ENV['ORGNAME']}"
  syntax_check_cache_path  "#{ENV['HOME']}/.chef/syntax_check_cache"
  cookbook_path            ["#{current_dir}/../cookbooks"]
  cookbook_copyright "Your Company, Inc."
  cookbook_license "apachev2"
  cookbook_email "cookbooks@yourcompany.com"

  # Amazon AWS
  knife[:aws_access_key_id] = ENV['AWS_ACCESS_KEY_ID']
  knife[:aws_secret_access_key] = ENV['AWS_SECRET_ACCESS_KEY']
