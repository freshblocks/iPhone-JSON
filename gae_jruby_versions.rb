# Gem Versions and Dates
# http://gist.github.com/280494

require "date"
puts "appengine gem versions: #{Time.now}"
cmd = "gem list | grep appengine"
#puts cmd
gems = `#{cmd}`.split("\n").collect{|v| v.strip }.sort

gems.each do |gem|
  if gem =~ /^(\S+) \((.+)\)$/
    name = $1
    versions = $2.split(",").collect{|v| v.strip }.sort
    puts "#{name}"
    versions.each do |version|
      cmd = "gem specification #{name} -v #{version} | grep date:"
      #puts cmd
      date = Date.parse(`#{cmd}`[/(\d\d\d\d-\d\d-\d\d)/, 1])
      puts " %-12s %s" % [version, date.strftime("%Y-%m-%d")]
    end
  end
end