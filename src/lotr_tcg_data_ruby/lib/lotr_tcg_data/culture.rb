module LotrTcgData
  class Culture
    extend Concerns::WithLocalData.new(path: "cultures.yml")
    include Concerns::WithRealmsYaml.new
    include Strict::Value

    attributes do
      key String
      name String
    end
  end
end