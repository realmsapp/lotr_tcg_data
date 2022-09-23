module LotrTcgData
  class PrintFinish
    extend Concerns::WithLocalData.new(path: "print_finishes.yml")
    include ValueSemantics.for_attributes {
      key String
      name String
    }
  end
end