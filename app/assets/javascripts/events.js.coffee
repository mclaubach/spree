window.createBid = (el, event_id, team) ->
  link = "/events/" + event_id + "/bids/make.json"
  $.post(link,
    choice_id: team
  )
  .done (response) ->
    $(".event-#{event_id}").find('.team').removeClass('selected-bid')
    $(el).parent('.team').addClass('selected-bid')
  .fail (jqHXR, textStatus) ->
    alert('error')

