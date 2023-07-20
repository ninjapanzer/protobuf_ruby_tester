
require 'rubygems'
require 'bundler/setup'
require 'json'

nested = File.read("json/nested_json.json")

puts nested

Dir[File.join(__dir__, './vendor/proto/protos', '**.rb')].each do |file|
  name = File.basename(file, '.rb').gsub!(/_pb$/, '').split('_').map(&:capitalize).join
  require file
end

message = Google::Protobuf.decode_json(
  Tester::Proto::NestedJSON,
  nested,
  ignore_unknown_fields: true,
)

puts message.data

nested_message = message.data.map do |d|
  Google::Protobuf.decode_json(
    Tester::Proto::Data,
    d.to_json,
    ignore_unknown_fields: true,
    )
end

puts nested_message.to_json