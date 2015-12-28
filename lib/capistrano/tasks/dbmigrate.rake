namespace :deploy do
	desc "Faz a migracao dos dados"
	task :dbmigrate do
		on roles(:all) do |host|
			within "#{current_path}" do
				with rails_env: :production do
					rake "db:migrate"
				end
			end
		end
	end
end