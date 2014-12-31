module ThreePLCentral
  module CoreExtensions
    def camelize(string)
      string.split("_").each {|s| s.capitalize! }.join("")
    end

    def underscore(string)
      string.scan(/[A-Z][a-z]*/).join("_").downcase
    end


    def constantize(string)
      string.split("::").inject(Object) { |n,c| n.const_get c }
    end
  end
end