disableSaveOnClick = ->
  $('form.edit_spree_order').submit ->
    $(this).find(':submit, :image').attr('disabled', true).removeClass('primary').addClass 'disabled'

$ ->
  setTimeout ->
    window.state_mapper = {"214":[[1061493585,"Alabama"],[403740659,"Alaska"],[948208802,"Arizona"],[471470972,"Arkansas"],[276110813,"California"],[536031023,"Colorado"],[69870734,"Connecticut"],[721598219,"Delaware"],[6764998,"District of Columbia"],[267271847,"Florida"],[876916760,"Georgia"],[199950338,"Hawaii"],[982433740,"Idaho"],[625629523,"Illinois"],[769938586,"Indiana"],[825306985,"Iowa"],[969722173,"Kansas"],[308473843,"Kentucky"],[37199952,"Louisiana"],[1055056709,"Maine"],[480368357,"Maryland"],[385551075,"Massachusetts"],[931624400,"Michigan"],[1032288924,"Minnesota"],[532363768,"Mississippi"],[653576146,"Missouri"],[999156632,"Montana"],[673350891,"Nebraska"],[179539703,"Nevada"],[426832442,"New Hampshire"],[750950030,"New Jersey"],[69729944,"New Mexico"],[889445952,"New York"],[177087202,"North Carolina"],[51943165,"North Dakota"],[485193526,"Ohio"],[248548169,"Oklahoma"],[298914262,"Oregon"],[471711976,"Pennsylvania"],[474001862,"Rhode Island"],[597434151,"South Carolina"],[615306087,"South Dakota"],[726305632,"Tennessee"],[525212995,"Texas"],[17199670,"Utah"],[989115415,"Vermont"],[41111624,"Virginia"],[414569975,"Washington"],[91367981,"West Virginia"],[103680699,"Wisconsin"],[66390489,"Wyoming"]]}

    if $('#checkout_form_address').is('*')
      $('#checkout_form_address').validate()
      get_states = (region) ->
        country = $('p#' + region + 'country' + ' span#' + region + 'country :first-child').val()
        state_mapper[country]

      update_state = (region) ->
        states = get_states(region)
        state_select = $('p#' + region + 'state select')
        state_input = $('p#' + region + 'state input')

        if states
          selected = state_select.val()
          state_select.html ''
          states_with_blank = [ [ '', '' ] ].concat(states)
          $.each states_with_blank, (pos, id_nm) ->
            opt = $(document.createElement('option')).attr('value', id_nm[0]).html(id_nm[1])
            opt.prop 'selected', true if selected is id_nm[0]
            state_select.append opt

          state_select.prop('disabled', false).show()
          state_input.hide().prop 'disabled', true
        else
          state_input.prop('disabled', false).show()
          state_select.hide().prop 'disabled', true

      $('p#bcountry select').change ->
        update_state 'b'

      $('p#scountry select').change ->
        update_state 's'

      update_state 'b'
      update_state 's'

      $('input#order_use_billing').click(->
        if $(this).is(':checked')
          $('#shipping .inner').hide()
          $('#shipping .inner input, #shipping .inner select').prop 'disabled', true
        else
          $('#shipping .inner').show()
          $('#shipping .inner input, #shipping .inner select').prop 'disabled', false
          if get_states('s')
            $('span#sstate input').hide().prop 'disabled', true
          else
            $('span#sstate select').hide().prop 'disabled', true
      ).triggerHandler 'click'

    if $('#checkout_form_payment').is('*')
      $('input[type="radio"][name="order[payments_attributes][][payment_method_id]"]').click(->
        $('#payment-methods li').hide()
        $('#payment_method_' + @value).show() if @checked
      ).triggerHandler 'click'
  , 500