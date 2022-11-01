module LotrTcgData
  class PrintFeature
    extend Concerns::WithLocalData.new(path: "print_features.yml")
    include Concerns::WithRealmsYaml.new
    include Strict::Value

    attributes do
      key String
      name String
      code String
    end

    def none? = key == "none"
  end
end