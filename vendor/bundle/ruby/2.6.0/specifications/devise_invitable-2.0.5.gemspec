# -*- encoding: utf-8 -*-
# stub: devise_invitable 2.0.5 ruby lib

Gem::Specification.new do |s|
  s.name = "devise_invitable".freeze
  s.version = "2.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Sergio Cambra".freeze]
  s.date = "2021-04-19"
  s.description = "It adds support for send invitations by email (it requires to be authenticated) and accept the invitation by setting a password.".freeze
  s.email = ["sergio@entrecables.com".freeze]
  s.homepage = "https://github.com/scambra/devise_invitable".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["--main".freeze, "README.rdoc".freeze, "--charset=UTF-8".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2.2".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "An invitation strategy for Devise".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<actionmailer>.freeze, [">= 5.0"])
      s.add_runtime_dependency(%q<devise>.freeze, [">= 4.6"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 2.0"])
    else
      s.add_dependency(%q<actionmailer>.freeze, [">= 5.0"])
      s.add_dependency(%q<devise>.freeze, [">= 4.6"])
      s.add_dependency(%q<bundler>.freeze, ["~> 2.0"])
    end
  else
    s.add_dependency(%q<actionmailer>.freeze, [">= 5.0"])
    s.add_dependency(%q<devise>.freeze, [">= 4.6"])
    s.add_dependency(%q<bundler>.freeze, ["~> 2.0"])
  end
end
