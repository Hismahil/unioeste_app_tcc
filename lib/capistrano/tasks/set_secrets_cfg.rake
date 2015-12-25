desc "copia o arquivo secrets para o release current"
task :set_secrets_cfg do
	on roles(:all) do |host|
    	execute :cp, "#{deploy_to}/shared/secrets.yml #{current_path}/config/"
    end
end