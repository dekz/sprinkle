module Sprinkle
  class PackageRepository

     def initialize opts={}
       @packages = {}
     end

     def add name, package
       @packages[name] ||= []
       @packages[name] << package
     end

     def find name, opts={}
       # TODO support wildcard versions?
       return nil unless @packages[name]
       found = nil
       if opts and opts[:version]
         found = @packages[name].select { |pkg| pkg.version == opts[:version] }
       else
         found = @packages[name]
       end
       return nil if found.empty?
       found.length == 1 ? found.first : found
     end

     def each
       @packages.each
     end

     def clear
       @packages.clear
     end
  end
end
