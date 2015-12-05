class ShiftSerializer < ActiveModel::Serializer
  attributes :id, :title, :start, :end, :url

  def title
    object.shift_description
  end

  def start
    object.start_time.to_datetime.strftime('%Q')
  end

  def end
    object.end_time.to_datetime.strftime('%Q')
  end

  def url
    shift_path(object)
  end
end
