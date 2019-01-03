require 'fiva'
require 'json'

Fiva::Logger.new
  .add_handler(Fiva::puts_handler(level: Fiva::DEBUG))
  .add_handler(Fiva::putsr_handler(level: Fiva::DEBUG, func: ->(msg) { msg.to_json }))
  .write(Fiva::DEBUG, 'Hello!', foo: 'bar')
  .debug('Debug', tv: Fiva::TextValue.new('Foo'))
  .io('A message', text: 'Hello, World!', payload: "foo\n  asdf")
  .info('Info')
  .important('Important')
  .warning('Warning')
  .error('Error')
  .fatal('Fatal')