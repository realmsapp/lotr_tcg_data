# frozen_string_literal: true

require_relative "lib/lotr_tcg_data/version"

Gem::Specification.new do |spec|
  spec.name = "lotr_tcg_data"
  spec.version = LotrTcgData::VERSION
  spec.authors = ["Tony Schneider"]
  spec.email = ["tonywok@gmail.com"]

  spec.summary = "Card data for the Lord of the Rings TCG"
  spec.homepage = "https://github.com/realmsapp/lotr_tcg_data"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/realmsapp/lotr_tcg_data"
  spec.metadata["changelog_uri"] = "https://github.com/realmsapp/lotr_tcg_data/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "value_semantics"
end
