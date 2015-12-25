desc "copia o arquivo de database para o release current"
task :set_database_cfg do
	on roles(:all) do |host|
    	execute :cp, "#{deploy_to}/shared/database.yml #{current_path}/config/"
    end
end