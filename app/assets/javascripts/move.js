$(document).ready(function() {

  var move1, move2,
      validMove;
  var countMoves = 0;

  $( init );
 
function init() {
}

  $('.grid').on('click', function(e) {
    e.preventDefault();  


    $('.draggable').draggable();

    // $('.droppable').droppable({
    //   drop: function (event, ui) {
    //     console.log ("dropped!");
    //     //$(this).html('dropped!');
    //   }
    // });

    if(countMoves%2 == 0){
      // determine origin coordinates
      move1 = $(this).text().split(' ').join('');
      console.log();
    }
    else{
      // determine destination coordinates
      //move2 = $(this).html().split(' ').join('');
      move2 = $(this).text().split(' ');
      validMove = $(this).hasClass('highlight')
      console.log(move2);
    }
    countMoves++;

    if(countMoves%2 == 0 && validMove){
      //move piece

    }
    else{
      // nullify moves
      //alert("Not a valid move");
    }

  });

});