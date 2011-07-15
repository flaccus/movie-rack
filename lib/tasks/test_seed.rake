namespace :db do
  namespace :test do
    desc "Prep the test database"
    task :prepare => :environment do
      Rake::Task["db:seed"].invoke
    end
  end
end

