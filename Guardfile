# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'bundler' do
  watch('Gemfile')
  watch(/^.+\.gemspec/)
end

guard 'rspec', :version => 2 do
  # Anything changes, run all specs!
  watch(%r{^.+\.rb$}) { 'spec' }
end

