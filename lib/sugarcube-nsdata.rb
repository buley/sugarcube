unless defined?(Motion::Project::Config)
  raise "The sugarcube gem must be required within a RubyMotion project Rakefile."
end


require 'sugarcube'
SugarCube.cocoa_only!('nsdata')

Motion::Project::App.pre_setup do |app|
  SugarCube.add_app_files(app, 'sugarcube-nsdata')
end
