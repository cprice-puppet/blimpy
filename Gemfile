source 'https://rubygems.org'

# Specify your gem's dependencies in blimpy.gemspec
gemspec

group :development do
  gem 'rake'
  gem 'rspec', '~> 2.11.0'
  gem 'cucumber'
  gem 'ci_reporter'
  gem 'aruba'
  gem 'tempdir'
  gem 'pry'
  if RUBY_VERSION > '1.9'
    gem 'ruby-debug19', :require => 'ruby-debug'
  else
    gem 'ruby-debug'
  end
end
