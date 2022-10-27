# frozen_string_literal: true

require "strict"
require "yaml"
require "active_support"
require "active_support/core_ext"
require "lotr_tcg_data/version"
require "lotr_tcg_data/concerns/with_local_data"
require "lotr_tcg_data/concerns/with_realms_yaml"
require "lotr_tcg_data/alignment"
require "lotr_tcg_data/keyword"
require "lotr_tcg_data/card_type"
require "lotr_tcg_data/culture"
require "lotr_tcg_data/rarity"
require "lotr_tcg_data/signet"
require "lotr_tcg_data/subtype"
require "lotr_tcg_data/set"
require "lotr_tcg_data/print_finish"
require "lotr_tcg_data/print_feature"
require "lotr_tcg_data/variant"
require "lotr_tcg_data/set_card"
require "lotr_tcg_data/card"

module LotrTcgData
  class Error < StandardError; end

  def self.root_path
    @root_path ||= Gem::Specification.find_by_name("lotr_tcg_data_ruby").gem_dir
  end

  def self.load_local(filename)
    YAML.safe_load(File.read(File.join(root_path, "data/", filename)), permitted_classes: ["Date"])
  end
end
