module LotrTcgData
  class Format
    extend Concerns::WithLocalData.new(path: "formats.yml")
    include ValueSemantics.for_attributes {
      key String
      display_name String
      set_numbers ArrayOf(Integer), default: []
    }
  end
end