# config valid only for current version of Capistrano
lock '3.4.0'

set :stage, :production
set :application, 'unioeste_app_tcc'
set :repo_url, 'https://github.com/Hismahil/unioeste_app_tcc.git'
set :scm, :git

#tem q ficar mudando essa linha
server "ec2-52-35-221-124.us-west-2.compute.amazonaws.com", :app, :web, :db, :primary => true

set :deploy_to, '/var/www/unioeste_app_tcc'
set :user, "ubuntu"
ssh_options[:keys] = "c:/aws/tcc.pem"

set :keep_releases, 5

# configuracao do capistrano-rails
set :rails_env, 'production'
set :migration_role, 'migrator'
set :conditionally_migrate, true #faz migração do db se tiver modificações
set :assets_roles, [:web, :app]
set :keep_assets, 1 #manter apenas 1 backup dos assets

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
