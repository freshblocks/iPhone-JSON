class Contact
  include DataMapper::Resource
  
  property :id,       Serial
  property :title,    String,        :required => true, :length => 500
  property :summary,  Text,          :required => true, :lazy => false
  property :birthday, Date,          :required => true
  property :url,      Link,          :required => true
  property :address,  PostalAddress, :required => true
  property :phone,    PhoneNumber,   :required => true
  timestamps :at 
end
