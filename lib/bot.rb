# rubocop:disable Metrics/BlockLength
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/CyclomaticComplexity
require 'telegram_bot'
require './lib/fact'
require './lib/cuteness'
require './lib/geek_joke'
require './lib/star_wars_quote'

class Bot
  attr_reader :bot, :new_updates

  def initialize
    token = '1402298027:AAHBWwLSVVGmeZKi8Kmog5HgYja7VmK6WlY'
    @bot = TelegramBot.new(token: token)
    @new_updates = update
  end

  private

  def update
    @bot.new_updates(fail_silently: true) do |message|
      puts "@#{message.from.username}: #{message.text}"
      command = message.get_command_for(@bot)

      message.reply do |reply|
        case command

        when /start/i
          reply.text = 'Hi! I am EazyMacBot, type /help to see what I can do for you'

        when /help/i
          reply.text = "/fact :Gives you a random useless fact
                    /geek_joke :Tells you a geeky joke,
                    /star_quote :Gives you Star Wars quote to help you find the force,
                    /cute_me :Your daily supply of cuteness in the form of a dog photo"

        when '/fact'
          values = Fact.new
          value = values.make_the_request
          puts reply.text = "random useless fact :#{value['text']}"

        when '/cute_me'
          values = Cuteness.new
          value = values.make_the_request
          reply.text = "#{value['message']}. "

        when '/star_quote'
          values = StarQuote.new
          value = values.make_the_request
          reply.text = "#{value['starWarsQuote']}. "

        when '/geek_joke'
          values = GeekJoke.new
          value = values.make_the_request
          reply.text = "#{value['value']}."

        else
          reply.text = 'If I had facial expressions, You would see the confusion! type /help to see what I can do'
        end
        puts "sending #{reply.text.inspect} to @#{message.from.username}"
        reply.send_with(bot)
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/CyclomaticComplexity
