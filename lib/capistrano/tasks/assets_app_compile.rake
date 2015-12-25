desc "Faz a compilacao dos assets (o deploy já faz isso)"
task :assets_app_compile do
  on roles(:all) do |host|
    run "#{current_path}/rake assets:precompile RAILS_ENV=production"
  end
end