require_relative 'lib/bot'
require_relative 'lib/word_play'

bot = Bot.new(:name => 'Fred', :data_file => 'fred.bot')
puts bot.greeting

while input = gets and input.chomp != 'bye'
    puts '>> ' + bot.response_to(input)
end

puts bot.farewell

