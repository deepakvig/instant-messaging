window.client = new Faye.Client('/faye')

jQuery ->
  client.subscribe '/messages', (payload) ->
  	if payload.message
      $('#messages').append(payload.message) 
      element = $('#chat_area')
	  element.scrollTop(element.prop("scrollHeight"))

  client.subscribe '/active_users', (payload) ->
    if !($('#user_session_id_'+payload.user_id).length)
  	  $('#active_users').append(payload.active_user) 

  client.subscribe '/remove_users', (payload) ->
    console.log("Triggerd")