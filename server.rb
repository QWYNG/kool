require 'bundler/inline'
require 'sinatra'
require 'rexml/document'
require 'ruby-graphviz'


get '/', :provides => 'html' do
  send_file 'view/index.html'
end

post '/run-krun', provides: 'svg'  do
  request_data = JSON.parse(request.body.read)
  filename = request_data['filename']
  depth = request_data['depth']
  command = "krun #{filename} --depth #{depth} > build/out.xml"
  puts 'Running command: ' + command

  status = system(command)

  if status
    xml_data = File.read('build/out.xml')
    doc = REXML::Document.new(xml_data)
    graph = GraphViz.new(:G, type: :digraph)
    add_nodes(graph, doc)
    graph.output(svg: 'build/xml_tree.svg')

    File.read('build/xml_tree.svg')
  else
    status 500
    { error: 'Error executing command' }.to_json
  end
end

def add_nodes(graph, xml_node, parent_node = nil)
  if xml_node.is_a?(REXML::Text)
    return if xml_node.value.strip.empty?
    leaf_node = graph.add_nodes(parent_node.id + ': ' + xml_node.value.strip)
    graph.add_edges(parent_node, leaf_node) if parent_node
    leaf_node.color = 'green'
    leaf_node.shape = 'box'
    return
  end
  node = graph.add_nodes(xml_node.name)
  graph.add_edges(parent_node, node) if parent_node

  xml_node.children.each do |child|
    add_nodes(graph, child, node)
  end
end