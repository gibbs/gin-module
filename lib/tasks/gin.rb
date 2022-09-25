require 'json'
require 'opml-handler'

# rubocop:disable Layout/FirstHashElementIndentation
namespace :gin do
  desc 'Gin module dependency OPML generator'
  task :create_opml do
    metadata = File.read(File.join(File.dirname(__FILE__), '../../metadata.json'))
    metadata = JSON.parse(metadata)

    dependency_outline_attributes = []

    metadata['dependencies'].each do |dependency|
      dependency_outline_attributes.push({
        type:    'rss',
        title:   dependency['name'].tr('/', '-'),
        text:    dependency['name'].tr('/', '-'),
        version: 'RSS',
        htmlUrl: "https://forge.puppet.com/modules/#{dependency['name']}",
        xmlUrl:  "https://forge.puppet.com/#{dependency['name']}/rss"
      })
    end

    opml_hash = {
      outlines_attributes: [{
        text:     'Gin Module Dependencies',
        children: dependency_outline_attributes,
      }],
      title: 'Gin module dependency feed'
    }
    opml = OpmlHandler::Opml.new(opml_hash)
    opml_filepath = File.join(File.dirname(__FILE__), '../../modules.opml')

    file = File.new(opml_filepath, 'w')
    file.puts(opml.to_xml)
    file.close
  end
end
