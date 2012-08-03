disableSaveOnClick = ->
  ($ 'form.edit_spree_order').submit ->
    ($ this).find(':submit, :image').attr('disabled', true).removeClass('primary').addClass 'disabled'

$ ->
  if ($ '#checkout_form_address').is('*')
    ($ '#checkout_form_address').validate()
    get_states = (region) ->
      country = ($ 'p#' + region + 'country' + ' span#' + region + 'country :only-child').val()
      state_mapper[country]

    update_state = (region) ->
      states = get_states(region)
      state_select = ($ 'p#' + region + 'state select')
      state_input = ($ 'p#' + region + 'state input')
      if states
        selected = state_select.val()
        state_select.html ''
        states_with_blank = [ [ '', '' ] ].concat(states)
        $.each states_with_blank, (pos, id_nm) ->
          opt = ($ document.createElement('option')).attr('value', id_nm[0]).html(id_nm[1])
          opt.prop 'selected', true if selected is id_nm[0]
          state_select.append opt

        state_select.prop('disabled', false).show()
        state_input.hide().prop 'disabled', true
      else
        state_input.prop('disabled', false).show()
        state_select.hide().prop 'disabled', true

    ($ 'p#bcountry select').change ->
      update_state 'b'

    ($ 'p#scountry select').change ->
      update_state 's'

    update_state 'b'
    update_state 's'

    ($ 'input#order_use_billing').click(->
      if ($ this).is(':checked')
        ($ '#shipping .inner').hide()
        ($ '#shipping .inner input, #shipping .inner select').prop 'disabled', true
      else
        ($ '#shipping .inner').show()
        ($ '#shipping .inner input, #shipping .inner select').prop 'disabled', false
        if get_states('s')
          ($ 'span#sstate input').hide().prop 'disabled', true
        else
          ($ 'span#sstate select').hide().prop 'disabled', true
    ).triggerHandler 'click'

  if ($ '#checkout_form_payment').is('*')
    ($ 'input[type="radio"][name="order[payments_attributes][][payment_method_id]"]').click(->
      ($ '#payment-methods li').hide()
      ($ '#payment_method_' + @value).show() if @checked
    ).triggerHandler 'click'