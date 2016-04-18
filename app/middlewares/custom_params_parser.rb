class CustomParamsParser < ActionDispatch::ParamsParser
  def initialize(app, parsers={}, &block)
    super app,
          parsers.merge({
            Mime[:msgpack] => lambda {|raw_post|
              data = ActiveSupport::MessagePack.decode(raw_post)
              data.is_a?(Hash) ? data : { _msgpack: data }
            }
          }),
          &block
  end
end
