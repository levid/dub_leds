pt = Rake::Task['assets:precompile']
Rake.application.send(:eval, "@tasks.delete('assets:precompile')")

namespace :assets do
  task :precompile do
    module ::Mongoid
      def load!(config_file)
        puts "Skipping connection to Mongo DB"
      end
    end

    pt.execute
  end
end