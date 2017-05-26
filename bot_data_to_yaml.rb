require 'yaml'
require_relative 'lib/knowledge_writer'

writer = KnowledgeWriter.new
puts writer.knowledge.to_yaml
writer.write(ARGV.first || 'bot_data.yml')

