$(document).ready(function() {
  clickSearch();
});

  var clickSearch = function(){
    $("#search-form").on("submit", function(poo){
      poo.preventDefault();

      var targetAction = $(this).attr("action")
      var targetMethod = $(this).attr("method")
      var targetData = $(this).serialize()
      console.log(targetAction, targetData)
      $.ajax({
        method: targetMethod,
        url: targetAction,
        data: targetData
      })
      .done(function(response){
        console.log(response)
      // $(".search").after(response)
      })
      .fail(function(response){
      // debugger
        alert("Server error")
      })
    })

  }
