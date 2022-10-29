module LotrTcgData
  class Format
    extend Concerns::WithLocalData.new(path: "formats.yml")
    include Concerns::WithRealmsYaml.new
    include Strict::Value

    attributes do
      key String
      name String
      set_numbers ArrayOf(Integer), default: []
    end
  end
end