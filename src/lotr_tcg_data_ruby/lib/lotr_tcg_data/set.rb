module LotrTcgData
  class Set
    include ValueSemantics.for_attributes {
      key String
      name String
      number Integer
    }
  end
end