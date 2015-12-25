desc "Faz upload do secrets.yml"
task :upload_secrets_cfg do
  on roles(:all) do |host|
    upload!('config/secrets.yml', "#{deploy_to}/shared/")
  end
end