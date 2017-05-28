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

    it 'produces a random greeting' do
        bot = Bot.new({:data_file => @file})

        greeting = bot.greeting
        greeting.sub! 'Unnamed bot', '[name]' if greeting.include? 'Unnamed bot'

        expect(@writer.knowledge[:responses][:greeting]).to include(greeting)
    end

    it 'selects a farewell randomly' do
        bot = Bot.new({:data_file => @file})

        farewell = bot.farewell

        expect(@writer.knowledge[:responses][:farewell]).to include(farewell)
    end

    it 'selects a default message when given an unknown message' do
        bot = Bot.new({:data_file => @file})

        default = bot.response_to("I'm an instructor")

        expect(@writer.knowledge[:responses][:default]).to include(default)
    end

    it 'responds randomly to another greeting' do
        bot = Bot.new({:data_file => @file})

        response = bot.response_to('Hello again')

        expect(@writer.knowledge[:responses]['hello']).to include(response)
    end

    it 'knows how to respond with a question to a phrase that includes a wildcard' do
        bot = Bot.new({:data_file => @file})

        response = bot.response_to('everyone knows programming')

        expect(response).to end_with 'knows programming?'
    end

    it 'makes a question when someone tries to describe it' do
        bot = Bot.new({:data_file => @file})

        response = bot.response_to('You are very intelligent')

        expect(response).to end_with 'I am very intelligent?'
    end
end

