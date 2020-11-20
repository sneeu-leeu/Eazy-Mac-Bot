require 'telegram_bot'

class Bot
  attr_reader :bot, :get_updates

  def initialize
    token = '1402298027:AAHBWwLSVVGmeZKi8Kmog5HgYja7VmK6WlY'
    @bot = TelegramBot.new(token: token)
    @get_updates = update
  end

  private

  def update
    @bot.get_updates(fail_silently: true) do |message|
      puts "@#{message.from.username}: #{message.text}"
      command = message.get_command_for(@bot)

      message.reply do |reply|
        case command

        when /start/i
          instructions = ['Hi, Im EazyMacBot! type /help to see what I can do']
          reply.text = "#{instructions.sample.capitalize},
      #{message.from.first_name}!"

    end
  end
end