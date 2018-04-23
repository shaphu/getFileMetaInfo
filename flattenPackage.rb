require 'rexml/document'
include REXML

xmlfile = File.new("package.xml")
xmldoc = Document.new(xmlfile)
File.delete("flattenPackageXML.txt") if File.exist?("flattenPackageXML.txt")

xmldoc.elements.each("Package/types") { |t|
  t.elements.each("name") { |n|
    t.elements.each("members") {
      |m| 
      output = File.open( "flattenPackageXML.txt","a" )
      output.puts "#{n.text}/#{m.text}"
    #   puts "#{n.text}/#{m.text}"
      output.close
    }
  }
}

`sh changeOwner.sh`