json.array! @reservations do |reservation|
    json.id reservation.id
    json.title reservation.details
    json.start reservation.date.strftime("%FT%T")
    json.end reservation.date.strftime("%FT%T")
    json.user_id reservation.user_id
end