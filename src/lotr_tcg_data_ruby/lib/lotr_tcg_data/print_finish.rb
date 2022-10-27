module LotrTcgData
  class PrintFinish
    extend Concerns::WithLocalData.new(path: "print_finishes.yml")
    include Strict::Value

    attributes do
      key String
      name String
    end
  end
end