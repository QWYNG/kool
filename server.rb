require 'bundler/inline'
require 'sinatra'
require 'nokogiri'

get '/', :provides => 'html' do
  send_file 'view/index.html'
end

post '/run-krun' do
  content_type :json

  request_data = JSON.parse(request.body.read)
  filename = request_data['filename']
  depth = request_data['depth']
  command = "krun #{filename} --depth #{depth} > view/out.xml"
  puts 'Running command: ' + command

  status = system(command)

  if status
    xml_data = File.read('view/out.xml')
    transformed_xml = transform_xml(xml_data)
    transformed_xml.to_json
  else
    status 500
    { error: 'Error executing command' }.to_json
  end
end

def transform_xml(xml)
  xslt_path = 'view/out.xslt'
  xslt = Nokogiri::XSLT(File.read(xslt_path))
  doc = Nokogiri::XML(xml)
  transformed = xslt.transform(doc)
  transformed.to_s
end



