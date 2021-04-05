json.array! @reservations do |reservation|
    json.id reservation.id
    json.title reservation.details
    json.start reservation.date.strftime("%FT%T")
    json.end reservation.date.strftime("%FT%T")
    json.user_id reservation.user_id
    json.past_week Time.now.beginning_of_week(start_day = :sunday) > reservation.date
    json.user do
        json.name reservation.user.name
    end
end