class HourlyData

  def initialize(data)
    @data = data
  end

  def decorate
    @data.map do |hash|
      time = DateTime.parse(hash['DATE_TIME'])
      if in_range(time)
        build(hash)
      end
    end.compact
  end

  private

  def highlight(uv)
    uv.to_i > 5 ? 'red' : 'default'
  end

  def in_range(time)
    floor = DateTime.now.utc.change({ hour: 9 })
    ceiling = DateTime.now.utc.change({ hour: 21 })
    time.between?(floor, ceiling)
  end

  def build(hash)
    {
        hour: DateTime.parse(hash['DATE_TIME']).strftime('%-I %P'),
        order: hash['ORDER'],
        uv_index: hash['UV_VALUE'],
        class: highlight(hash['UV_VALUE'])
    }
  end

end