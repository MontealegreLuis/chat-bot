require_relative 'bot'
require_relative 'word_play'

bot = Bot.new(:name => 'Fred', :data_file => 'fred.bot')
puts bot.greeting

while input = gets and input.chomp != 'end'
    puts '>> ' + bot.response_to(input)
end

puts bot.farewell

