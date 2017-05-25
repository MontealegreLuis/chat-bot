require 'spec_helper'
require 'string'
require 'word_play'

describe WordPlay do
    it 'separates text in sentences' do
        expect("a. b. c d. e f g.".sentences).to eq(["a", "b", "c d", "e f g"])
        test_text = %q{Hello. This is a test
of sentence separation. This is the end
of the test.}
        expect(test_text.sentences[2]).to eq("This is the end of the test")
    end

    it 'separates a sentence into words' do
        expect("this is a test".words).to eq(%w{this is a test})
        expect("these are, mostly, words".words).to eq(%w{these are mostly words})
    end

    it 'selects best sentences from text' do
        expect(WordPlay.best_sentence(['This is a test',
'This is another test',
'This is a great test'],
%w{test great this})).to eq('This is a great test')

        expect(WordPlay.best_sentence(['This is a great test'], %w{still the best})).to eq('This is a great test')
    end

    it 'swaps basic pronouns' do
        expect(WordPlay.switch_pronouns("you are a robot")).to eq("i am a robot")
        expect(WordPlay.switch_pronouns("i am a person")).to eq("you are a person")
        expect(WordPlay.switch_pronouns("you love me")).to eq("i love you")
    end

    it 'swaps mixed pronouns' do
        expect(WordPlay.switch_pronouns("i gave you life")).to eq("you gave me life")
        expect(WordPlay.switch_pronouns("you are not what i am")).to eq("i am not what you are")
        expect(WordPlay.switch_pronouns("you annoy my dog")).to eq("i annoy your dog")
    end
end

