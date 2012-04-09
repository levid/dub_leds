class Cookie extends $DUB.Utilities
  constructor: (@options) ->
    this

  updateStoredCookie: (data) ->
    $.ajax
      type: "POST"
      url: "/cookie"
      data: data,
      success: (data) ->
        # console.log(data)

$DUB.Utilities.Cookie = new Cookie