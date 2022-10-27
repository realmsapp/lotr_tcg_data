# frozen_string_literal: true

require "strict"
require "yaml"
require "active_support"
require "active_support/core_ext"
require "zeitwerk"
loader = Zeitwerk::Loader.for_gem
loader.setup

module LotrTcgData
  class Error < StandardError; end

  def self.root_path
    @root_path ||= Gem::Specification.find_by_name("lotr_tcg_data_ruby").gem_dir
  end

  def self.load_local(filename)
    YAML.safe_load(read_local(filename), permitted_classes: ["Date"])
  end

  def self.read_local(filename)
    File.read(File.join(root_path, "data/", filename))
  end
end
