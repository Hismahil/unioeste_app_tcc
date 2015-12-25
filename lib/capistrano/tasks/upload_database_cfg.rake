desc "Faz upload do database.yml"
task :upload_database_cfg do
  on roles(:all) do |host|
    upload!('config/database.yml', "#{deploy_to}/shared/")
  end
end