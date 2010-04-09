
# code from jruby-json.appspot.com
def my_search(query)
  url = "http://search.twitter.com/search.json?q=" + CGI::escape(query)
  JSON.parse(AppEngine::URLFetch::HTTP.get(URI.parse(url)))
end

def my_html(query)
  title = "JSON-JRuby and URLFetch on AppEngine"
  cells = my_search(query)['results'].map { |e|
    "<tr valign='top'><td><img src='#{e['profile_image_url']}' " +
    "width='48'></td><td>#{e['text']}</td></tr>" }.join("\n")
  html = <<HTML
<html><head><title>#{title}</title></head><body>
<h2>#{title}</h2><p>This is a Twitter Search for: #{query}</p>
<table style='width:500px; font-family:sans-serif; font-size:10pt;'><tbody>
#{cells}</tbody></table></body></html>
HTML
  html
end

run lambda { |env| [200, {}, my_html('charles nutter') ] }