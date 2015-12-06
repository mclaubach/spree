window.createBid = (el, event_id, team, user) ->
  link = "/events/" + event_id + "/bids/make.json"
  $.post(link,
    bid:
      choice_id: team
  )
  .done (response) ->
    debugger
    $(el).parent('.team').siblings().removeClass('selected-bid')
    $(el).parent('.team').addClass('selected-bid')
  .fail (jqHXR, textStatus) ->
    alert('error')
