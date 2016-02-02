# config valid only for current version of Capistrano
lock '3.4.0'

set :stage, :production
set :application, 'unioeste_app_tcc'
set :repo_url, 'https://github.com/Hismahil/unioeste_app_tcc.git'
set :deploy_to, '/var/www/unioeste_app_tcc'
set :scm, :git

#tem q ficar mudando essa linha
role :app, %w{ec2-54-69-119-104.us-west-2.compute.amazonaws.com}
role :web, %w{ec2-54-69-119-104.us-west-2.compute.amazonaws.com}
role :db,  %w{ec2-54-69-119-104.us-west-2.compute.amazonaws.com}

set :keep_releases, 5

# configuracao do capistrano-rails
set :rails_env, 'production'
set :migration_role, 'migrator'
set :conditionally_migrate, true #faz migração do db se tiver modificações
set :assets_roles, [:web, :app]
set :keep_assets, 1 #manter apenas 1 backup dos assets

namespace :deploy do

end