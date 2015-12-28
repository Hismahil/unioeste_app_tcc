namespace :deploy do
	desc "Faz a compilacao dos assets (o deploy já faz isso)"
	task :assets_app_compile do
	  on roles(:all) do |host|
	  	within "#{current_path}" do
	  		with rails_env: :production do 
	  			rake "assets:precompile RAILS_ENV=production"
	    	end
	    end
	  end
	end
end