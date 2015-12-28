desc "reinicia o passenger"
task :restart do
	on roles(:all) do |host|
    	execute :touch, "#{current_path}/tmp/restart.txt"
    end
end