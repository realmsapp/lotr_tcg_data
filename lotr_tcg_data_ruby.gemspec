# frozen_string_literal: true

gem_source = "src/lotr_tcg_data_ruby"
require_relative File.join(gem_source, "lib/lotr_tcg_data/version")

Gem::Specification.new do |spec|
  spec.name = "lotr_tcg_data_ruby"
  spec.version = LotrTcgData::VERSION
  spec.authors = ["Tony Schneider"]
  spec.email = ["tonywok@gmail.com"]

  spec.summary = "Card data for the Lord of the Rings TCG"
  spec.homepage = "https://github.com/realmsapp/lotr_tcg_data"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/realmsapp/lotr_tcg_data"
  spec.metadata["changelog_uri"] = "https://github.com/realmsapp/lotr_tcg_data/CHANGELOG.md"

  spec.files = Dir["data/**/*", "LICENSE", "README.md", "lotr_tcg_data_ruby.gemspec", "src/lotr_tcg_data_ruby/**/*"]
  spec.bindir = File.join(gem_source, "bin")
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["src/lotr_tcg_data_ruby/lib"]

  spec.add_dependency "value_semantics"
  spec.add_dependency "activesupport"
  spec.add_dependency "any_ascii"
  spec.add_development_dependency "terminal-table"
end
