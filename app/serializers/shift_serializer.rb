class ShiftSerializer < ActiveModel::Serializer
  attributes :title, :id, :start, :end, :url

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
    "http://127.0.0.1:3000/shifts/#{object.id}.json"
  end
end
