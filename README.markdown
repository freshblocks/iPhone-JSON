iPhone-json

A Ruby on Rails app running on Google App Engine with DataMapper to serve JSON data to an iPhone and Android App


Types from DataMapper & AppEngine datastore

 pp (DataMapper::Property::PRIMITIVES +
     DataMapper::Types.constants.map{|c| DataMapper::Types.const_get(c)}.
     select{|t|t.respond_to? :primitive}).map {|c| c.to_s.split('::')[-1]}.uniq.sort

 ["AncestorKey",
  "AppEngineNativeType",
  "AppEngineStringType",
  "BigDecimal",
  "Blob",
  "Boolean",
  "ByteString",
  "Category",
  "Class",
  "Date",
  "DateTime",
  "Discriminator",
  "Email",
  "Float",
  "Integer",
  "Key",
  "Link",
  "List",
  "Object",
  "ParanoidBoolean",
  "ParanoidDateTime",
  "PhoneNumber",
  "PostalAddress",
  "Rating",
  "Serial",
  "String",
  "Text",
  "Time",
  "TrueClass"]

