# frozen_string_literal: true

require_relative "lib/faker/gpk/version"

Gem::Specification.new do |spec|
  spec.name = "faker-gpk"
  spec.version = Faker::GPK::VERSION
  spec.authors = ["Rob Lacey"]
  spec.email = ["contact@robl.me"]

  spec.summary = "Faker extension for Garbage Pail Kids"
  spec.description = "Faker extension for Garbage Pail Kids"
  spec.homepage = "https://github.com/braindeaf/faker-gpk"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage + '/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  
  spec.require_paths = ["lib"]

  spec.add_dependency "faker", "~> 3.0"
end
