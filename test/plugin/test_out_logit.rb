require 'test/unit'

require 'fluent/test'
require 'fluent/plugin/out_logit'

#require 'webmock/test_unit'
require 'date'

require 'helper'

$:.push File.expand_path("../lib", __FILE__)
$:.push File.dirname(__FILE__)

#WebMock.disable_net_connect!

class TestTcpOutput < Test::Unit::TestCase
  def setup
    Fluent::Test.setup
    stub_socket
    @driver = driver('test', "stack_id 9c2c3bc9-b196-4338-adeb-2e638fbb6988
                              port 15358
                              ")
  end

  def driver(tag='test', conf='')
    @driver ||= Fluent::Test::BufferedOutputTestDriver.new(Fluent::LogitOutput, tag).configure(conf)
  end

  def sample_record
    {'age' => 26, 'request_id' => '42', 'parent_id' => 'parent', 'sub' => {'field'=>{'pos'=>15}}}
  end

  def stub_socket
    server = TCPServer.new 24225
    Thread.start do
      loop do
        Thread.start(server.accept) do |client|
          while (b = client.read)
            #puts ">> #{b}"
          end
          client.close
        end
      end
    end
end

  def test_writes_to_default_index
    5.times.each do |t|
      @driver.emit(sample_record)
    end
    @driver.run
  end
end
