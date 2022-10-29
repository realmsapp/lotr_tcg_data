module LotrTcgData
  class Keyword
    extend Concerns::WithLocalData.new(path: "keywords.yml")
    include Concerns::WithRealmsYaml.new
    include Strict::Value

    attributes do
      key String
      name String
    end
  end
end