module LotrTcgData
  class Culture
    include ValueSemantics.for_attributes {
      key String
      name String
    }
  end
end