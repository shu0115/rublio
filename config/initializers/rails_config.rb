RailsConfig.setup do |config|
  config.const_name = "Settings"
end

# For Heroku
config.assets.initialize_on_precompile = false
RubyPython.configure python_exe: 'python2.6'
