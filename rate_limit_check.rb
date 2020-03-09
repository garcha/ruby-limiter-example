require "bundler"
Bundler.require(:default)

COUNT = 50
RATE = 5
INTERVAL = 5

class CallCheck
  extend Limiter::Mixin
  limit_method :puts_hello, rate: RATE, interval: INTERVAL

  def initialize
    @tick = 0
  end

  def puts_hello(count = 1)
    puts "Hello #{@tick}"
    @tick += count
  end
end

callcheck = CallCheck.new
COUNT.times { callcheck.puts_hello }
