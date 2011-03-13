require 'yaml'
class Rails < Thor
  FILES = %w[config/application.rb config/environment.rb config/environments/development.rb config/environments/test.rb config/environments/production.rb config/routes.rb config.ru initializers/secret_token.rb initializers/session_store.rb]

  desc "rename [OLD, NEW]", "rename rails 3 app"
  def rename(old, new)
    puts "renaming Rails 3 app from #{old} to #{new}"

    FILES.each do |file|
      if File.exist?(file)
        lines = []

        File.open(file, "r") {|f| lines = f.readlines }
		puts lines.length, lines
        lines = eval(lines[0])
        #lines = lines.inject([]) {|l, line| l << line.gsub(old, new)}
        File.open(file, "w") {|f| f.write(lines.join) }

        puts "Yeah! #{file} has been processed."
      else
        puts "Oh! #{file} does not exist."
      end
    end

  end
end