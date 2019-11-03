# frozen_string_literal: true

# server-based syntax
# ======================
set :branch, 'master'
set :server_ip, '18.219.133.155'

set :nginx_server_name, "communication_app #{fetch(:application)}.local"

server fetch(:server_ip), user: 'ubuntu', roles: %w[web app db]
