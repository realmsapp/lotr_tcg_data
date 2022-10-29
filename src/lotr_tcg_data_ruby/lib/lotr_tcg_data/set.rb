module LotrTcgData
  class Set
    extend Concerns::WithLocalData.new(path: "sets.yml")
    include Concerns::WithRealmsYaml.new
    include Strict::Value

    attributes do
      key String
      name String
      number Integer
      release_date Date
    end
  end
end