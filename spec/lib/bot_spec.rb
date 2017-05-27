require 'spec_helper'
require 'knowledge_writer'
require 'bot'

describe Bot do
    before :each do
        @file = 'test.bot'
        @writer = KnowledgeWriter.new
        @writer.write(@file)
    end

    it 'gets a default name if none is provided' do
        bot = Bot.new({:data_file => @file})
        expect(bot.name).to eq('Unnamed bot')
    end

    it 'fails when its knowledge file does not exist' do
        expect { Bot.new({:data_file => 'foo.bot'}) }.to raise_exception(/foo\.bot/)
    end

    it 'produces a random greet' do
        bot = Bot.new({:data_file => @file})
        greeting = bot.greeting
        greeting.sub! 'Unnamed bot', '[name]' if greeting.include? 'Unnamed bot'
        expect(@writer.knowledge[:responses][:greeting]).to include(greeting)
    end
end

