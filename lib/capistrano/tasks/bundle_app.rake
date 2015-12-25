desc "Faz o bundle install da aplicação (o deploy já faz isso)"
task :bundle_app do
  on roles(:all) do |host|
    run "#{current_path}/bundle install --deployment --without development test"
  end
end