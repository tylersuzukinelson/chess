$(document).ready(function() {

  var move1, move2,
      validMove;
  var countMoves = 0;


  $('.grid').on('click', function(e) {
    e.preventDefault();  
    // alert( $(this).text() );
    if(countMoves%2 == 0){
      move1 = $(this).text().split(' ').join('');
      console.log(move1);
    }
    else{
      move2 = $(this).text().split(' ').join('');
      validMove = $(this).hasClass('highlight')
      console.log(move2);
    }
    countMoves++;

    if(countMoves%2 == 0 && validMove){
      // make a post request!
      alert('lol');
    }
    else{
      // nullify moves
    }

  });

});