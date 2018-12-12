json.event do
  json.id @event.id
  json.title @event.title
  json.address @event.location
  json.thumbnail @event.image.url(:thumb)
  json.latitude @event.lat
  json.logitude @event.lng
end