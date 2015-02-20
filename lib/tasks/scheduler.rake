desc "This task pulls new blog data from api's."
task :grab_new => :environment do 
  puts "Updating feed..."
  Article.grab_new
  puts "done."
end