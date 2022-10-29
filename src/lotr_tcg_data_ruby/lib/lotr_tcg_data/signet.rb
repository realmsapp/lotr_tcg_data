module LotrTcgData
  class Signet
    extend Concerns::WithLocalData.new(path: "signets.yml")
    include Concerns::WithRealmsYaml.new
    include Strict::Value

    attributes do
      key String
      name String
    end
  end
end