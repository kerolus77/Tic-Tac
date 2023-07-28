import 'package:flutter/material.dart';
import 'package:tic_tac/game_logic.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String activePlayer='X';
  bool gameOver=false;
  int turn=0;
  String result='';
  Game game=Game();
  bool isSwitched =false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
      body:MediaQuery.of(context).orientation==Orientation.portrait? Column(
        children: [
          ...fristBlock(),
          _expanded(context),
          ...lastBlock()
        ],
      ):Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             ...fristBlock(),
               ...lastBlock()
          ],),
        ),
        _expanded(context)

      ]),
    ));
  }
List<Widget> fristBlock(){
  return[Expanded(
    // flex: 1,
    child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Turn Off',style:Theme.of(context).textTheme.titleLarge,),
                  Switch.adaptive(value: isSwitched, onChanged:(value) {
                  setState(() {
                      isSwitched=value;
                  });
                  },
                ),
                  Text('On Two Player',style:Theme.of(context).textTheme.titleLarge)
                ],
              ),
              
            ),
  ),
 
         (gameOver==false&& turn!=9)?Text("It's $activePlayer Turn".toUpperCase(),
          style: const TextStyle(
            fontSize: 52,
          ),):const Text('')
          ];
}
  Expanded _expanded(BuildContext context) {
    return Expanded( 
      flex:MediaQuery.of(context).orientation==Orientation.portrait? 4:1,
      child: GridView.count(
          padding: const EdgeInsets.all(10),
        crossAxisCount: 3,
        mainAxisSpacing: 7,
        crossAxisSpacing: 7, 
        childAspectRatio: 1,
        
        children: List.generate(9, (index) => InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap:gameOver?null:()=>_onTap(index),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).splashColor,
              borderRadius: BorderRadius.circular(16),
              
            ),
            child:  Center(
              child: Text(Player.playerX.contains(index)?'X':Player.playerO.contains(index)?'O':'',
              style:TextStyle(color:Player.playerX.contains(index)? Colors.blue:Colors.red,fontSize: 52) ,),
            ),
          ),
        )),));
  }

  List<Widget> lastBlock(){
    return[Expanded(
      // flex: 1,
      child: Text(result.toUpperCase(),
            style: const TextStyle(
              fontSize: 42,
            ),),
    ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ElevatedButton.icon(
              onPressed: (){
              setState(() {
                Player.playerO=[];
                  Player.playerX=[];
                activePlayer='X';
                gameOver=false;
                turn=0;
                result='';
              });
            }, 
            icon: const Icon(Icons.replay),
            label: const Text('Repeat The Game'),
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Theme.of(context).shadowColor)),),
          )];
  }
  
_onTap(int index) async {
  
  if((Player.playerX.isEmpty || !Player.playerX.contains(index))&&(Player.playerO.isEmpty||!Player.playerO.contains(index)))
 {  game.playGame(index,activePlayer);checkBox();
 if(!isSwitched&&!gameOver&&turn!=9){
  await game.outoPlayer(activePlayer);
  checkBox();
 }
 }

  }

  void checkBox() {
  setState(() {
  activePlayer=activePlayer=='X'?'O':'X';
  turn++;
  var winnerPlayer=game.checkWinner();
  if(winnerPlayer!=''){
    result='$winnerPlayer Is Winner';
    gameOver=true;
  }
else if(turn==9)
 { result="It's Draw!";}
  
}
  );
  }
}
