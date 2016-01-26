namespace :deploy do

	desc "Reinicia o apache (pelo puppet não esta funcionando)"
	task :restart_apache do
		on roles(:all) do |host|
			execute("sudo service apache2 restart")
		end
	end
	
end