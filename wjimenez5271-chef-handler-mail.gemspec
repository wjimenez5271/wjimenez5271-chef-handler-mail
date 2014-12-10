lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'chef/handler/mail/version'

Gem::Specification.new do |s|
  s.name = 'wjimenez5271-chef-handler-mail'
  s.version = MailHandler::VERSION
  s.platform = Gem::Platform::RUBY
  s.summary = "Chef report handler that uses pony to send an email. Based on Mathieu Sauve-Frankel's chef-handler-mail"
  s.description = s.summary
  s.author = "William Jimenez"
  s.email = "wjimenez5271@gmail.com"
  s.homepage = "https://github.com/wjimenez5271/chef-handler-mail"
  s.require_path = 'lib'
  s.files = %w(LICENSE README.md) + Dir.glob("lib/**/*")
  s.add_runtime_dependency "pony"
end

