class HourlyDataDecorator

  def initialize(data)
    @data = data
  end

  def decorate
    @data.map do |hash|
      {
          hour: DateTime.parse(hash['DATE_TIME']).strftime('%-I %P'),
          order: hash['ORDER'],
          uv_index: hash['UV_VALUE']
      }
    end
  end

end