module LotrTcgData
  class Culture
    extend Concerns::WithLocalData.new(path: "cultures.yml")
    include ValueSemantics.for_attributes {
      key String
      name String
    }
  end
end