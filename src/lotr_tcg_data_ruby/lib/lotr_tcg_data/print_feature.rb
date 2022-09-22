module LotrTcgData
  class PrintFeature
    include ValueSemantics.for_attributes {
      key String
      name String
    }
  end
end