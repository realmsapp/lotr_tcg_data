module LotrTcgData
  class Set
    extend Concerns::WithLocalData.new(path: "sets.yml")
    include ValueSemantics.for_attributes {
      key String
      name String
      number Integer
      release_date Date
    }
  end
end