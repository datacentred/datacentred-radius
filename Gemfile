source "http://rubygems.org"

group :test do
  gem 'rake'
  gem 'puppet', ENV['PUPPET_VERSION'] || '> 2.7.0'
  gem 'puppet-lint'
  # Support ruby 1.8.7
  # https://github.com/rspec/rspec-core/issues/1864
  gem 'rspec', '< 3.2.0', {"platforms"=>["ruby_18"]}, 
  gem 'rspec-puppet', '> 1.0.0'
  gem 'rspec-puppet-utils'
  gem 'puppet-syntax'
  gem 'puppetlabs_spec_helper'
end

group :development do
  gem 'travis'
  gem 'puppet-blacksmith'
end
