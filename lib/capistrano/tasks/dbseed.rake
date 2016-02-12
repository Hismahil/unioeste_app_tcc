namespace :deploy do
	desc "Executa rake db:seed"
	task :dbseed do
		on roles(:all) do |host|
			within "#{current_path}" do
				with rails_env: :production do
					rake "db:seed"
				end
			end
		end
	end
end