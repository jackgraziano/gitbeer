$(document).ready(function() {
  $('.daterange').daterangepicker({
      autoUpdateInput: false,
      locale: {
          cancelLabel: 'Clear'
      }
  });

  $('.daterange').on('cancel.daterangepicker', function(ev, picker) {
      $(this).val('');
  });

  $('.daterange').on('apply.daterangepicker', function(ev, picker){
    $(this).val(picker.startDate.format('DD/MM/YYYY') + ' - ' + picker.endDate.format('DD/MM/YYYY'));
    $('#booking_start_date').val(picker.startDate.format('DD-MM-YYYY'));
    $('#booking_end_date').val(picker.endDate.format('DD-MM-YYYY'));
  })

});

