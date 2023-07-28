import 'dart:math';
class Player {

  static  const x='X';
  static  const o='O';
  static  const empty='';
  static List playerX=[];
  static List playerO=[];
}

extension ContainsAll on List{
 bool containsAll(int a,int b,[c]){
if(c==null){
  return contains(a)&&contains(b);
}
else{
  return contains(a)&&contains(b)&&contains(c);
}
  }
}
class Game {
  void playGame(int index, String activePlayer) {
    if(activePlayer=='X'){
      Player.playerX.add(index);
    }
   else{
      Player.playerO.add(index);
    }
  }
 String checkWinner(){
    String winner='';
   
    if(Player.playerX.containsAll(0,1,2)||
    Player.playerX.containsAll(3,4,5)||
    Player.playerX.containsAll(6,7,8)||
    Player.playerX.containsAll(0,3,6)||
    Player.playerX.containsAll(1,4,7)||
    Player.playerX.containsAll(2,5,8)||
    Player.playerX.containsAll(0,4,8)||
    Player.playerX.containsAll(2,4,6)){winner='X';
    }
   else  if(Player.playerO.containsAll(0,1,2)||
    Player.playerO.containsAll(3,4,5)||
    Player.playerO.containsAll(6,7,8)||
    Player.playerO.containsAll(0,3,6)||
    Player.playerO.containsAll(1,4,7)||
    Player.playerO.containsAll(2,5,8)||
    Player.playerO.containsAll(0,4,8)||
    Player.playerO.containsAll(2,4,6)){winner='O';}
    else{ winner='';}
    return winner;
  }
  Future<void> outoPlayer(String activePlayer)async{
    int index=0;
    List<int> emptyCell=[];

    for(int i=0;i<9;i++){
      if(!(Player.playerX.contains(i)||Player.playerO.contains(i))){
        emptyCell.add(i);
      }
    }
    //start--center
    if(Player.playerO.containsAll(0,1)&&emptyCell.contains(2)){
      index=2;
    }
    else if(Player.playerO.containsAll(3,4)&&emptyCell.contains(5)){
      index=5;
    }
     else if(Player.playerO.containsAll(6,7)&&emptyCell.contains(8)){
      index=8;
    }
     else if(Player.playerO.containsAll(0,3)&&emptyCell.contains(6)){
      index=6;
    }
     else if(Player.playerO.containsAll(1,4)&&emptyCell.contains(7)){
      index=7;
    }
     else if(Player.playerO.containsAll(2,5)&&emptyCell.contains(8)){
      index=8;
    }
     else if(Player.playerO.containsAll(0,4)&&emptyCell.contains(8)){
      index=8;
    }
  
     else if(Player.playerO.containsAll(2,4)&&emptyCell.contains(6)){
      index=6;
    }
     //start--end
   else if(Player.playerO.containsAll(0,2)&&emptyCell.contains(1)){
      index=1;
    }
    else if(Player.playerO.containsAll(3,5)&&emptyCell.contains(4)){
      index=4;
    }
     else if(Player.playerO.containsAll(6,8)&&emptyCell.contains(7)){
      index=7;
    }
     else if(Player.playerO.containsAll(0,6)&&emptyCell.contains(3)){
      index=3;
    }
     else if(Player.playerO.containsAll(1,7)&&emptyCell.contains(4)){
      index=4;
    }
     else if(Player.playerO.containsAll(2,8)&&emptyCell.contains(5)){
      index=5;
    }
     else if(Player.playerO.containsAll(0,8)&&emptyCell.contains(4)){
      index=4;
    }
  
     else if(Player.playerO.containsAll(2,6)&&emptyCell.contains(4)){
      index=4;
    }
     //center--end
   else if(Player.playerO.containsAll(2,1)&&emptyCell.contains(0)){
      index=0;
    }
    else if(Player.playerO.containsAll(5,4)&&emptyCell.contains(3)){
      index=3;
    }
     else if(Player.playerO.containsAll(8,7)&&emptyCell.contains(6)){
      index=6;
    }
     else if(Player.playerO.containsAll(6,3)&&emptyCell.contains(0)){
      index=0;
    }
     else if(Player.playerO.containsAll(7,4)&&emptyCell.contains(1)){
      index=1;
    }
     else if(Player.playerO.containsAll(8,5)&&emptyCell.contains(2)){
      index=2;
    }
     else if(Player.playerO.containsAll(8,4)&&emptyCell.contains(0)){
      index=0;
    }
  
     else if(Player.playerO.containsAll(6,4)&&emptyCell.contains(2)){
      index=2;
    }


    //
     //start--center
   else if(Player.playerX.containsAll(0,1)&&emptyCell.contains(2)){
      index=2;
    }
    else if(Player.playerX.containsAll(3,4)&&emptyCell.contains(5)){
      index=5;
    }
     else if(Player.playerX.containsAll(6,7)&&emptyCell.contains(8)){
      index=8;
    }
     else if(Player.playerX.containsAll(0,3)&&emptyCell.contains(6)){
      index=6;
    }
     else if(Player.playerX.containsAll(1,4)&&emptyCell.contains(7)){
      index=7;
    }
     else if(Player.playerX.containsAll(2,5)&&emptyCell.contains(8)){
      index=8;
    }
     else if(Player.playerX.containsAll(0,4)&&emptyCell.contains(8)){
      index=8;
    }
  
     else if(Player.playerX.containsAll(2,4)&&emptyCell.contains(6)){
      index=6;
    }
     //start--end
   else if(Player.playerX.containsAll(0,2)&&emptyCell.contains(1)){
      index=1;
    }
    else if(Player.playerX.containsAll(3,5)&&emptyCell.contains(4)){
      index=4;
    }
     else if(Player.playerX.containsAll(6,8)&&emptyCell.contains(7)){
      index=7;
    }
     else if(Player.playerX.containsAll(0,6)&&emptyCell.contains(3)){
      index=3;
    }
     else if(Player.playerX.containsAll(1,7)&&emptyCell.contains(4)){
      index=4;
    }
     else if(Player.playerX.containsAll(2,8)&&emptyCell.contains(5)){
      index=5;
    }
     else if(Player.playerX.containsAll(0,8)&&emptyCell.contains(4)){
      index=4;
    }
  
     else if(Player.playerX.containsAll(2,6)&&emptyCell.contains(4)){
      index=4;
    }
     //center--end
   else if(Player.playerX.containsAll(2,1)&&emptyCell.contains(0)){
      index=0;
    }
    else if(Player.playerX.containsAll(5,4)&&emptyCell.contains(3)){
      index=3;
    }
     else if(Player.playerX.containsAll(8,7)&&emptyCell.contains(6)){
      index=6;
    }
     else if(Player.playerX.containsAll(6,3)&&emptyCell.contains(0)){
      index=0;
    }
     else if(Player.playerX.containsAll(7,4)&&emptyCell.contains(1)){
      index=1;
    }
     else if(Player.playerX.containsAll(8,5)&&emptyCell.contains(2)){
      index=2;
    }
     else if(Player.playerX.containsAll(8,4)&&emptyCell.contains(0)){
      index=0;
    }
  
     else if(Player.playerX.containsAll(6,4)&&emptyCell.contains(2)){
      index=2;
    }
    else{  Random random=Random();
    int inderRandom=random.nextInt(emptyCell.length);
    index=emptyCell[inderRandom];}
    playGame(index, activePlayer);
  }
}

