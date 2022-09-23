module LotrTcgData
  class PrintFeature
    extend Concerns::WithLocalData.new(path: "print_features.yml")
    include ValueSemantics.for_attributes {
      key String
      name String
    }
  end
end