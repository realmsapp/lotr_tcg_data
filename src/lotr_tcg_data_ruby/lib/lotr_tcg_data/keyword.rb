module LotrTcgData
  class Keyword
    extend Concerns::WithLocalData.new(path: "keywords.yml")
    include ValueSemantics.for_attributes {
      key String
      name String
    }
  end
end