module LotrTcgData
  class Signet
    include ValueSemantics.for_attributes {
      key String
      name String
    }
  end
end