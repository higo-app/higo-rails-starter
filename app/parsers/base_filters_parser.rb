class BaseFiltersParser
  def self.extract(params)
    new(params).extract
  end

  def initialize(params)
    @params = params
  end

  def extract
    [array_filters, integer_range_filters, date_range_filters].inject(&:merge)
  end

  private

  attr_reader :params

  def array_filters
    return {} unless respond_to?(:array_filter_keys, true)

    array_filter_keys.map do |key|
      params[key] ? [key, Array(params[key])] : nil
    end.compact.to_h
  end

  def integer_range_filters
    return {} unless respond_to?(:integer_range_filter_keys, true)

    integer_range_filter_keys.map do |key|
      if params["#{key}_min"] || params["#{key}_max"]
        [key, params["#{key}_min"]&.to_i || params["#{key}_max"]&.to_i]
      end
    end.compact.to_h
  end

  def date_range_filters
    return {} unless respond_to?(:date_range_filter_keys, true)

    date_range_filter_keys.map do |key|
      if params["#{key}_min"] || params["#{key}_max"]
        [
          key,
          (params["#{key}_min"] && Time.parse(params["#{key}_min"]))..
            (params["#{key}_max"] && Time.parse(params["#{key}_max"]))
        ]
      end
    end.compact.to_h
  end
end
