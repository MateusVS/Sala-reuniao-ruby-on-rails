import { Calendar } from "@fullcalendar/core";
import dayGridPlugin from '@fullcalendar/daygrid'
import timeGridPlugin from '@fullcalendar/timegrid'
import interactionPlugin from '@fullcalendar/interaction'
import listPlugin from '@fullcalendar/list'
import ptLocale from '@fullcalendar/core/locales/pt-br'

document.addEventListener('turbolinks:load', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new Calendar(calendarEl, {
        locale: ptLocale,
        header: {
          left: 'prev, next',
          right: 'dayGridMonth, listMonth'
        },
        plugins: [ timeGridPlugin, dayGridPlugin, listPlugin, interactionPlugin ],
        initialView: 'timeGridWeek',
        defaultView: 'timeGridWeek',
        slotMinTime: '06:00:00',
        contentHeight: 450,
        nowIndicator: false,
        slotMaxTime: '23:00:00',
        allDaySlot: false,
        slotDuration: '01:00:00',
        slotLabelInterval: '01:00:00',
        selectable: true,
        hiddenDays: [0, 6],
        titleFormat: {
          year: 'numeric',
          month: '2-digit',
          day: 'numeric',
          day: '2-digit'
        },
        slotLabelFormat: {
          hour: 'numeric',
          minute: '2-digit',
          omitZeroMinute: false,
          meridiem: 'short'
        },
        //slotLaneContent: 'Disponível',
        select: function (info) {
          const { start } = info;
          let date = start.getFullYear() + '-' + (start.getMonth() + 1).toString().padStart(2, '0') + '-' + start.getDate().toString().padStart(2, '0');
          let time = start.getHours().toString().padStart(2, '0') + ':' + start.getMinutes().toString().padStart(2, '0');
          $("#reservation_date").val(date + 'T' + time);
          $("#reservation_details").val("");
          $("#newReservation").modal();
        },
        eventClick: function (info) {
          const { id } = info.event;
          $.ajax({
            url: `/reservations/${id}/edit`,
            success: function(data) {
              data.map(reservation => {
                $("#editReservation #reservation_details").val(reservation.title)
                $("#editReservation #reservation_date").val(reservation.start);
                $("#editReservation #reservation_user_id").val(reservation.user_id);
                $("#editReservation #reservation_id").val(reservation.id);
                $("#editReservation #userName").val(reservation.user.name);
                $("#editReservation form").attr("action", `/reservations/${id}`);
                $("#confirmDeleteModal form").attr("action", `/reservations/${id}`);
                $("#nomeAgendamento").html(reservation.title);

                if (reservation.past_week) {
                  $("#deleteBtn").fadeOut();
                  $("#confirmationBtn").fadeOut();
                  $("#editReservationLabel").html("Visualizar Reserva");
                } else {
                  if ($("#userId").val() != reservation.user_id) {
                    $("#deleteBtn").fadeOut();
                    $("#confirmationBtn").fadeOut();
                    $("#editReservationLabel").html("Visualizar Reserva");
                  } else {
                    $("#deleteBtn").fadeIn();
                    $("#confirmationBtn").fadeIn();
                    $("#editReservationLabel").html("Editar Reserva");
                  }
                }
              });
            },
          });
          $("#editReservation").modal();
        },
        events: '/reservations/load_events.json'
      });
      calendar.render();
});
