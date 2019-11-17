# frozen_string_literal: true

# server-based syntax
# ======================
set :branch, 'production'
set :server_ip, '18.219.133.155'

set :nginx_server_name, "http://connectpoint.online/ #{fetch(:application)}.local"

server fetch(:server_ip), user: 'ubuntu', roles: %w[web app db]
