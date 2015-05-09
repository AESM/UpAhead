json.array!(@agendas) do |agenda|
  json.extract! agenda, :id, :title, :description
  json.url agenda_url(agenda, format: :json)
end
