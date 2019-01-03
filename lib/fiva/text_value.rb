module Fiva
  class TextValue < String
    def inspect
      self.to_s
    end
  end
end