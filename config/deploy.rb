lock '3.5.0'

set :repo_url, 'git@github.com:thefi669/investasiku.git'

set :user, 'deployer'
set :application, 'investasiku'
set :rails_env, 'production'

server '103.56.207.133', user: "#{fetch(:user)}", roles: %w{app db web}, primary: true

set :deploy_to, "/home/#{fetch(:user)}/#{fetch(:application)}"
set :pty, true

set :linked_files, fetch(:linked_files, []).push('config/application.yml', 'config/database.yml', 'config/secrets.yml', 'config/puma.rb')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :config_example_suffix, '.example'
set :config_files, %w{config/application.yml config/database.yml config/secrets.yml}
set :puma_conf, "#{shared_path}/config/puma.rb"

namespace :deploy do
  before 'check:linked_files', 'config:push'
  before 'check:linked_files', 'puma:config'
  before 'check:linked_files', 'puma:nginx_config'
  before 'deploy:migrate', 'deploy:db:create'
  after 'puma:smart_restart', 'nginx:restart'
  after 'nginx:restart', 'cloudinary:sync_static'
end
