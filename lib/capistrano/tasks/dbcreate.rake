desc "Cria o banco de dados"
task :dbcreate do
	on roles(:all) do |host|
		within "#{current_path}" do
			with rails_env: :production do
				rake "db:create"
			end
		end
	end
end