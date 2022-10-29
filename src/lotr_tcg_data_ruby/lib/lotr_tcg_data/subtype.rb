module LotrTcgData
  class Subtype
    extend Concerns::WithLocalData.new(path: "subtypes.yml")
    include Concerns::WithRealmsYaml.new
    include Strict::Value

    attributes do
      key String
      name String
    end
  end
end