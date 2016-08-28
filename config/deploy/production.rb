server '52.196.56.44', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/ikeda/.ssh/id_rsa_ec2'
