$(function () {
  $("#modalToggle").click(function () {
    $("#modal").modal({
      backdrop: "static"
    });
  });

  $("#infoContinue").click(function (e) {
    e.preventDefault();
    $(".progress-bar").css("width", "40%");
    $(".progress-bar").html("Step 2 of 5");
    $('#myTab a[href="#ads"]').tab("show");
  });

  $("#adsContinue").click(function (e) {
    e.preventDefault();
    $(".progress-bar").css("width", "60%");
    $(".progress-bar").html("Step 3 of 5");
    $('#myTab a[href="#placementPanel"]').tab("show");
  });

  $("#placementContinue").click(function (e) {
    e.preventDefault();
    $(".progress-bar").css("width", "80%");
    $(".progress-bar").html("Step 4 of 5");
    $('#myTab a[href="#schedulePanel"]').tab("show");
  });

  $("#scheduleContinue").click(function (e) {
    e.preventDefault();
    $(".progress-bar").css("width", "100%");
    $(".progress-bar").html("Step 5 of 5");
    $('#myTab a[href="#reviewPanel"]').tab("show");
  });

  $("#activate").click(function (e) {
    e.preventDefault();
    var formData = {
      campaign_name: $("#campaignName").val(),
      start_date: $("#start-date").val(),
      end_date: $("#end-date").val(),
      days: {
        sunday: $("#sunday").prop("checked"),
        monday: $("#monday").prop("checked"),
        tuesday: $("#tuesday").prop("checked"),
        wednesday: $("#wednesday").prop("checked"),
        thurday: $("#thursday").prop("checked"),
        friday: $("#friday").prop("checked"),
        saturday: $("#saturday").prop("checked")
      },
      start_time: $("#start-time").val(),
      end_time: $("#end-time").val()
    };
    alert(JSON.stringify(formData));
  });
});
