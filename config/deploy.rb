# frozen_string_literal: true

# config valid for current version and patch releases of Capistrano
lock '~> 3.11.0'

set :application, 'comunication_app'
set :repo_url, 'git@bitbucket.org:adelsaleh46/rahma_app.git'
set :rails_env, fetch(:stage)
append :rvm_map_bins, 'rails'

set :deploy_to, "/var/www/html/comunication_app"

set :format_options, command_output: true,
                     log_file: 'log/capistrano.log',
                     color: :auto,
                     truncate: false
set :rvm_type, :user
set :rvm_ruby_version, '2.5.1'

append :linked_files, 'config/database.yml', 'config/master.key', '.env'

append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system', 'storage'

set :keep_releases, 2