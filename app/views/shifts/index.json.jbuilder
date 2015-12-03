json.array!(@shifts) do |shift|
  json.extract! shift, :id, :shift_description, :start_time, :end_time, :schedule_id
  json.url shift_url(shift, format: :json)
end
