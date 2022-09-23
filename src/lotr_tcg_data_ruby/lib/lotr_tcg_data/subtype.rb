module LotrTcgData
  class Subtype
    extend Concerns::WithLocalData.new(path: "subtypes.yml")
    include ValueSemantics.for_attributes {
      key String
      name String
    }
  end
end