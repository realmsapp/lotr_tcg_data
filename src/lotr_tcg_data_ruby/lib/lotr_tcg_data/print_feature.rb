module LotrTcgData
  class PrintFeature
    extend Concerns::WithLocalData.new(path: "print_features.yml")
    include Strict::Value

    attributes do
      key String
      name String
    end
  end
end