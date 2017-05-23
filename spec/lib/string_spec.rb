require 'spec_helper'
require 'string'

describe String do
    it 'can be divided into words' do
        words = "This is an example".words

        expect(words.length).to be(4)
        expect(words[0]).to eq("This")
        expect(words[1]).to eq("is")
        expect(words[2]).to eq("an")
        expect(words[3]).to eq("example")
    end

    it 'can be divided into sentences' do
        sentences = %q{Hello.
This is a test.
This is the third line.}.sentences

        expect(sentences.length).to be(3)
        expect(sentences[0]).to eq("Hello")
        expect(sentences[1]).to eq("This is a test")
        expect(sentences[2]).to eq("This is the third line")
    end
end

