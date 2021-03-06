class Agilibox::SmallData::FilterStrategyByDateBegin < ::Agilibox::SmallData::FilterStrategyByKeyValue
  def apply(query, value)
    value = Time.zone.parse(value).beginning_of_day
    query.where("#{key} >= ?", value)
  end
end
