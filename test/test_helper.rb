$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
$LOAD_PATH.unshift File.expand_path("../factories", __FILE__)

require "dotenv"
Dotenv.load
require "orbital/gateway"
require "minitest/autorun"
require "faker"
require "pry"
