module LotrTcgData
  class Variant
    include ValueSemantics.for_attributes {
      key String
      name String
    }
  end
end