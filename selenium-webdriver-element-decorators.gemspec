# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{selenium-webdriver-element-decorators}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Alexei Barantsev"]
  s.date = %q{2011-02-17}
  s.description = %q{Selenium 2.0 (WebDriver) decorators for web-elements that provide specific methods fot each web-element}
  s.email = %q{barancev@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    "lib/selenium/webdriver/elements.rb",
    "lib/selenium/webdriver/elements/browser.rb",
    "lib/selenium/webdriver/elements/button.rb",
    "lib/selenium/webdriver/elements/checkbox.rb",
    "lib/selenium/webdriver/elements/element.rb",
    "lib/selenium/webdriver/elements/file_chooser.rb",
    "lib/selenium/webdriver/elements/form.rb",
    "lib/selenium/webdriver/elements/select.rb",
    "lib/selenium/webdriver/elements/textbox.rb"
  ]
  s.homepage = %q{http://github.com/barancev/selenium-webdriver-element-decorators}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Selenium 2.0 (WebDriver) decorators for web-elements}
  s.test_files = [
    "spec/browser_spec.rb",
    "spec/form_populate_spec.rb",
    "spec/form_spec.rb",
    "spec/spec_helper.rb",
    "spec/textbox_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["~> 2.5.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<selenium-webdriver>, ["~> 0.1.3"])
      s.add_development_dependency(%q<au3>, ["~> 0.1.2"])
      s.add_runtime_dependency(%q<selenium-webdriver>, ["~> 0.1.3"])
      s.add_runtime_dependency(%q<au3>, ["~> 0.1.2"])
    else
      s.add_dependency(%q<rspec>, ["~> 2.5.0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<selenium-webdriver>, ["~> 0.1.3"])
      s.add_dependency(%q<au3>, ["~> 0.1.2"])
      s.add_dependency(%q<selenium-webdriver>, ["~> 0.1.3"])
      s.add_dependency(%q<au3>, ["~> 0.1.2"])
    end
  else
    s.add_dependency(%q<rspec>, ["~> 2.5.0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<selenium-webdriver>, ["~> 0.1.3"])
    s.add_dependency(%q<au3>, ["~> 0.1.2"])
    s.add_dependency(%q<selenium-webdriver>, ["~> 0.1.3"])
    s.add_dependency(%q<au3>, ["~> 0.1.2"])
  end
end

