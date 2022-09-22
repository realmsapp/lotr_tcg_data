module LotrTcgData
  class Subtype
    include ValueSemantics.for_attributes {
      key String
      name String
    }
  end
end