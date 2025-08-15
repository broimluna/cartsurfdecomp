function startGame2()
{
   if(firstTime == true)
   {
      OPJ.startGame();
      firstTime = false;
   }
   if(hardcoreMode)
   {
      trace("====HARDCORE MODE====");
      myLives = 1;
      mcLives.gotoAndStop(3);
   }
   mcLives._visible = true;
   mcScore._visible = true;
   myGame = new Object();
   myGame.isCorner = false;
   myGame.gameOver = false;
   myGame.isKeyDown = false;
   myGame.stanceCounter = 0;
   myGame.maxStanceCounter = 24;
   myGame.isStanceCounterUsed = false;
   myGame.screenScore = 0;
   myGame.points = 0;
   myGame.bonusPoints = 0;
   myGame.stance = "none";
   myGame.isTrick = false;
   myGame.trick = undefined;
   myGame.spinDir = "none";
   myGame.lastTrick = undefined;
   myGame.isStraight = true;
   myGame.numTricks = 0;
   myGame.isMove = false;
   myGame.move = undefined;
   myGame.moveCounter = 0;
   myGame.maxGrindMoveCounter = 28;
   myGame.maxSlideMoveCounter = 32;
   myGame.maxMoveCounter = 38;
   myGame.isCrashed = false;
   wobbling = false;
   myFrames = new Object();
   myFrames.none = 1;
   myFrames.surfing = 5;
   myFrames.wheelie = 10;
   myFrames.jumping = 14;
   myStanceFrames = new Object();
   myStanceFrames.none = 1;
   myStanceFrames.surfing = 5;
   myTrickDone = new Object();
   myTrickDone.olie = "surfing";
   myTrickDone.handstand = "surfing";
   myTrickDone.backflip = "none";
   myTrickDone.spin = "none";
   myTrickDone.flap = "none";
   myTrickDone.slam = "none";
   myTrickDone.running = "none";
   myScores = new Object();
   myScores.olie = 20;
   myScores.backflip = 100;
   myScores.slam = 30;
   myScores.spin = 80;
   myScores.handstand = 80;
   myScores.flap = 50;
   myScores.running = 80;
   myScores.grind = 80;
   myScores.slide = 40;
   myScores.lean = 10;
   currentSeg = myLastSafeSeg;
   var _loc1_ = [];
   myKey = new Object();
   myKey.onKeyDown = function()
   {
      if(!myGame.isTrick && !myGame.isCrashed)
      {
         if(Key.isDown(37))
         {
            myGame.keyDown = "left";
         }
         else if(Key.isDown(39))
         {
            myGame.keyDown = "right";
         }
         else if(Key.isDown(38))
         {
            myGame.keyDown = "up";
         }
         else if(Key.isDown(40))
         {
            myGame.keyDown = "down";
         }
         else if(Key.isDown(32))
         {
            myGame.keyDown = "space";
         }
         if(myGame.stance == "surfing")
         {
            if(myGame.keyDown == "left")
            {
               myGame.isMove = true;
               myGame.move = "slide";
               mcCart.gotoAndStop(7);
               OPJ.sendFeatureOpcodes("slide_left");
            }
            else if(myGame.keyDown == "right")
            {
               myGame.isMove = true;
               myGame.move = "slide";
               mcCart.gotoAndStop(8);
               OPJ.sendFeatureOpcodes("slide_right");
            }
            else if(myGame.keyDown == "space")
            {
               myGame.isTrick = true;
               myGame.trick = "olie";
               mcCart.gotoAndStop(6);
               OPJ.sendFeatureOpcodes("olie");
            }
            else if(myGame.keyDown == "up")
            {
               myGame.isTrick = true;
               myGame.trick = "handstand";
               mcCart.gotoAndStop(18);
               OPJ.sendFeatureOpcodes("handstand");
            }
            else if(myGame.keyDown == "down")
            {
               noStance();
            }
         }
         else if(myGame.stance == "wheelie")
         {
            if(myGame.keyDown == "left")
            {
               myGame.isMove = true;
               myGame.move = "grind";
               mcCart.gotoAndStop(12);
               OPJ.sendFeatureOpcodes("grind_left");
            }
            else if(myGame.keyDown == "right")
            {
               myGame.isMove = true;
               myGame.move = "grind";
               mcCart.gotoAndStop(13);
               OPJ.sendFeatureOpcodes("grind_right");
            }
            else if(myGame.keyDown == "down")
            {
               myGame.isTrick = true;
               myGame.trick = "running";
               mcCart.gotoAndStop(20);
               OPJ.sendFeatureOpcodes("run_with_cart");
            }
            else if(myGame.keyDown == "space")
            {
               myGame.isTrick = true;
               myGame.trick = "backflip";
               mcCart.gotoAndStop(11);
               OPJ.sendFeatureOpcodes("backflip");
            }
            else if(myGame.keyDown == "up")
            {
               noStance();
            }
         }
         else if(myGame.stance == "jumping")
         {
            if(myGame.keyDown == "left")
            {
               myGame.isTrick = true;
               myGame.trick = "spin";
               myGame.spinDir = "left";
               mcCart.gotoAndStop(15);
               OPJ.sendFeatureOpcodes("360_left");
            }
            else if(myGame.keyDown == "right")
            {
               myGame.isTrick = true;
               myGame.trick = "spin";
               myGame.spinDir = "right";
               mcCart.gotoAndStop(16);
               OPJ.sendFeatureOpcodes("360_right");
            }
            else if(myGame.keyDown == "up")
            {
               myGame.isTrick = true;
               myGame.trick = "flap";
               mcCart.gotoAndStop(17);
               OPJ.sendFeatureOpcodes("flap_wings");
            }
            else if(myGame.keyDown == "down")
            {
               myGame.isTrick = true;
               myGame.trick = "slam";
               mcCart.gotoAndStop(19);
               OPJ.sendFeatureOpcodes("slam");
            }
         }
         else if(myGame.keyDown == "left")
         {
            myGame.isMove = true;
            myGame.move = "lean";
            mcCart.gotoAndStop(2);
            OPJ.sendFeatureOpcodes("lean_left");
         }
         else if(myGame.keyDown == "right")
         {
            myGame.isMove = true;
            myGame.move = "lean";
            mcCart.gotoAndStop(3);
            OPJ.sendFeatureOpcodes("lean_right");
         }
         else if(myGame.keyDown == "up")
         {
            myGame.stance = "surfing";
            mcCart.gotoAndStop(4);
         }
         else if(myGame.keyDown == "down")
         {
            myGame.stance = "wheelie";
            mcCart.gotoAndStop(9);
         }
         else if(myGame.keyDown == "space")
         {
            myGame.stance = "jumping";
            mcCart.gotoAndStop(14);
            OPJ.sendFeatureOpcodes("jump");
         }
         myGame.isKeyDown = true;
         myGame.stanceCounter = 0;
      }
   };
   myKey.onKeyUp = function()
   {
      opcodeSent = false;
      if(!myGame.isCrashed)
      {
         if(myGame.move == "grind" || myGame.move == "spin" || myGame.move == "lean")
         {
            stopMove();
            noStance();
         }
         else
         {
            stopMove();
         }
         myGame.keyDown = undefined;
      }
   };
   Key.addListener(myKey);
   mcGame.onEnterFrame = function()
   {
      if(!myGame.isCrashed)
      {
         if(myGame.isMove && !myGame.isCorner)
         {
            myGame.moveCounter += 1;
            if(myGame.moveCounter > myGame.maxMoveCounter)
            {
               myGame.isCrashed = true;
               reduceLives();
               stopGame();
               if(myGame.keyDown == "left")
               {
                  mcCart.gotoAndStop(21);
               }
               else
               {
                  mcCart.gotoAndStop(23);
               }
            }
            else if(myGame.moveCounter > myGame.maxSlideMoveCounter)
            {
               if(myGame.move == "slide")
               {
                  myGame.isCrashed = true;
                  reduceLives();
                  stopGame();
                  if(myGame.keyDown == "left")
                  {
                     mcCart.gotoAndStop(21);
                  }
                  else
                  {
                     mcCart.gotoAndStop(23);
                  }
               }
            }
            else if(myGame.moveCounter > myGame.maxGrindMoveCounter)
            {
               if(myGame.move == "grind")
               {
                  myGame.isCrashed = true;
                  reduceLives();
                  stopGame();
                  mcCart.gotoAndStop(22);
               }
            }
         }
         if(myGame.isCorner)
         {
            if(myGame.isTrick)
            {
               crash();
            }
            else
            {
               if(mineArray[currentSeg] == 2)
               {
                  if(myGame.keyDown != "right")
                  {
                     crash();
                  }
               }
               else if(myGame.keyDown != "left")
               {
                  crash();
               }
               myGame.trickCounter = 0;
            }
         }
         if(myGame.moveCounter >= myGame.maxMoveCounter - 10)
         {
            wobbling = true;
         }
         else if(myGame.moveCounter >= myGame.maxSlideMoveCounter - 10 && myGame.move == "slide")
         {
            wobbling = true;
         }
         else if(myGame.moveCounter >= myGame.maxGrindMoveCounter - 10 && myGame.move == "grind")
         {
            wobbling = true;
         }
      }
      updateScore();
      if(!hasPuffle)
      {
         mcCart.art.puffle._visible = false;
         mcCart.art.enters.puffle._visible = false;
      }
   };
   noStance();
   mcGame.gotoAndStop(mineArray[currentSeg]);
   mcCart.gotoAndStop(24);
}
function stopTrick()
{
   if(myGame.isTrick && !myGame.isCrashed)
   {
      mcPoint.gotoAndStop(1);
      mcPoint.gotoAndPlay(2);
      myGame.isTrick = false;
      myGame.stance = myTrickDone[myGame.trick];
      mcCart.gotoAndStop(myFrames[myGame.stance]);
      if(myGame.lastTrick == myGame.trick)
      {
         var _loc1_ = Math.floor(myScores[myGame.trick] / 2);
         myGame.points = _loc1_;
         myScore += _loc1_;
      }
      else
      {
         _loc1_ = myScores[myGame.trick];
         myGame.points = _loc1_;
         myScore += _loc1_;
      }
      if(myGame.trick == "backflip")
      {
         numFlipsInRow++;
      }
      else if(myGame.trick != "slide")
      {
         numFlipsInRow = 0;
      }
      if(numFlipsInRow >= 20)
      {
         com.clubpenguin.util.Stamp.sendStamp(224);
         OPJ.sendStampOpcodes(224);
      }
      if(myGame.trick == "spin" && (myGame.spinDir == "left" || myGame.spinDir == "right"))
      {
         if(!tricksDone[myGame.spinDir + "spin"])
         {
            tricksDone[myGame.spinDir + "spin"] = true;
            if(++numUniqueTricks >= 14)
            {
               com.clubpenguin.util.Stamp.sendStamp(218);
               OPJ.sendStampOpcodes(218);
            }
         }
      }
      else if(!tricksDone[myGame.trick])
      {
         tricksDone[myGame.trick] = true;
         if(++numUniqueTricks >= 14)
         {
            com.clubpenguin.util.Stamp.sendStamp(218);
            OPJ.sendStampOpcodes(218);
         }
      }
      if(wobbling)
      {
         com.clubpenguin.util.Stamp.sendStamp(212);
         OPJ.sendStampOpcodes(212);
         if(hasPuffle)
         {
            setTimeout(sendPufflePowerStamp,2000);
         }
      }
      if(myGame.stance == "surfing")
      {
         if(myGame.trick == "handstand")
         {
            numTricksOutCart++;
         }
         else if(myGame.trick == "olie")
         {
            numTricksOutCart++;
         }
      }
      else if(myGame.stance == "wheelie")
      {
         if(myGame.trick == "grind")
         {
            numTricksInCart++;
         }
         else if(myGame.trick == "running")
         {
            numTricksOutCart++;
         }
         else if(myGame.trick == "backflip")
         {
            numTricksInCart++;
         }
      }
      else if(myGame.stance == "jumping")
      {
         if(myGame.trick == "flap")
         {
            numTricksInCart++;
         }
         else if(myGame.trick == "spin")
         {
            numTricksInCart++;
         }
         else if(myGame.trick == "slam")
         {
            numTricksInCart++;
         }
      }
      else if(myGame.stance == "none")
      {
         if(myGame.trick == "spin")
         {
            numTricksInCart++;
         }
         else if(myGame.trick == "slam")
         {
            numTricksInCart++;
         }
         else if(myGame.trick == "flap")
         {
            numTricksInCart++;
         }
         else if(myGame.trick == "running")
         {
            numTricksOutCart++;
         }
         else if(myGame.trick == "backflip")
         {
            numTricksInCart++;
         }
      }
      myGame.lastTrick = myGame.trick;
      myGame.trick = undefined;
      myGame.numTricks += 1;
      if(numTricksInCart >= 10)
      {
         com.clubpenguin.util.Stamp.sendStamp(214);
         OPJ.sendStampOpcodes(214);
      }
      if(numTricksOutCart >= 10)
      {
         com.clubpenguin.util.Stamp.sendStamp(216);
         OPJ.sendStampOpcodes(216);
      }
      if(hasPuffle)
      {
         numTricksWithPuffle++;
         if(numTricksWithPuffle == 20)
         {
            com.clubpenguin.util.Stamp.sendStamp(226);
            OPJ.sendStampOpcodes(226);
         }
      }
   }
   wobbling = false;
}
function stopMove()
{
   if(myGame.isMove && !myGame.isCrashed)
   {
      if(myGame.move == "grind")
      {
         if(myGame.moveCounter > 10 || myGame.bonusPoints > 0)
         {
            mcPoint.gotoAndStop(1);
            mcPoint.gotoAndPlay(2);
            var _loc1_ = Math.round(myGame.moveCounter / myGame.maxGrindMoveCounter * myScores.grind);
            myGame.points = _loc1_ + myGame.bonusPoints;
            myScore += _loc1_ + myGame.bonusPoints;
            myGame.bonusPoints = 0;
         }
      }
      else if(myGame.move == "slide")
      {
         if(myGame.moveCounter > 10 || myGame.bonusPoints > 0)
         {
            mcPoint.gotoAndStop(1);
            mcPoint.gotoAndPlay(2);
            _loc1_ = Math.round(myGame.moveCounter / myGame.maxSlideMoveCounter * myScores.slide);
            myGame.points = _loc1_ + myGame.bonusPoints;
            myScore += _loc1_ + myGame.bonusPoints;
            myGame.bonusPoints = 0;
         }
      }
      if(myGame.move != "lean")
      {
         numFlipsInRow = 0;
         if(hasPuffle)
         {
            numTricksWithPuffle++;
            if(numTricksWithPuffle == 20)
            {
               com.clubpenguin.util.Stamp.sendStamp(226);
               OPJ.sendStampOpcodes(226);
            }
         }
      }
      if(!tricksDone[myGame.keyDown + myGame.move] && (myGame.keyDown == "right" || myGame.keyDown == "left"))
      {
         tricksDone[myGame.keyDown + myGame.move] = true;
         if(++numUniqueTricks >= 14)
         {
            com.clubpenguin.util.Stamp.sendStamp(218);
            OPJ.sendStampOpcodes(218);
         }
      }
      if(wobbling)
      {
         com.clubpenguin.util.Stamp.sendStamp(212);
         OPJ.sendStampOpcodes(212);
         if(hasPuffle)
         {
            setTimeout(sendPufflePowerStamp,2000);
         }
      }
      if(myGame.stance == "surfing")
      {
         if(myGame.move == "grind")
         {
            numTricksOutCart++;
         }
         else if(myGame.move == "slide")
         {
            numTricksOutCart++;
         }
      }
      else if(myGame.stance == "wheelie")
      {
         if(myGame.move == "grind")
         {
            numTricksInCart++;
         }
         else if(myGame.move == "slide")
         {
            numTricksInCart++;
         }
      }
      if(numTricksInCart >= 10)
      {
         com.clubpenguin.util.Stamp.sendStamp(214);
         OPJ.sendStampOpcodes(214);
      }
      if(numTricksOutCart >= 10)
      {
         com.clubpenguin.util.Stamp.sendStamp(216);
         OPJ.sendStampOpcodes(216);
      }
      myGame.isMove = false;
      myGame.moveCounter = 0;
      mcCart.gotoAndStop(myFrames[myGame.stance]);
      myGame.move = undefined;
   }
   wobbling = false;
}
function noStance()
{
   myGame.isTrick = false;
   myGame.trick = undefined;
   myGame.isMove = false;
   myGame.move = undefined;
   myGame.moveCounter = 0;
   myGame.stance = "none";
   mcCart.gotoAndStop(1);
}
function nextSeg()
{
   if(currentSeg == 27 && hardcoreMode == true)
   {
      trace("==HARDCORE RESET ARR==");
      currentSeg = 1;
   }
   if(mineArray[currentSeg] == 1)
   {
      myLastSafeSeg = currentSeg;
   }
   if(myGame.isCrashed || myGame == undefined || myGame.isGameOver)
   {
      currentSeg = myLastSafeSeg;
   }
   else
   {
      currentSeg++;
   }
   mcGame.gotoAndStop(mineArray[currentSeg]);
}
function startCorner()
{
   myGame.isCorner = true;
}
function stopCorner()
{
   myGame.isCorner = false;
   if(!myGame.isCrashed)
   {
      if(myGame.move == "grind")
      {
         myGame.bonusPoints = 10;
      }
      else if(myGame.move == "slide")
      {
         myGame.bonusPoints = 10;
      }
      else
      {
         var _loc1_ = myScores.lean;
      }
      if(_loc1_ != undefined)
      {
         mcPoint.gotoAndStop(1);
         mcPoint.gotoAndPlay(2);
         myGame.points = _loc1_;
         myScore += _loc1_;
      }
      if(myGame.move == "grind")
      {
         numGrindCorners++;
         if(numGrindCorners == 8)
         {
            com.clubpenguin.util.Stamp.sendStamp(220);
            OPJ.sendStampOpcodes(220);
         }
      }
      if(myGame.stance == "surfing")
      {
         numSurfCorners++;
         if(numSurfCorners == 8)
         {
            com.clubpenguin.util.Stamp.sendStamp(222);
            OPJ.sendStampOpcodes(222);
         }
      }
   }
}
function crash()
{
   numFlipsInRow = 0;
   myGame.isCrashed = true;
   mcCart.gotoAndStop(22);
   reduceLives();
   stopGame();
}
function reduceLives()
{
   myLives -= 1;
   mcLives.gotoAndStop(5 - myLives);
}
function stopGame()
{
   if(!myGame.isGameOver)
   {
      if(myLives > 0)
      {
         Key.removeListener(myKey);
         mcGame.onEnterFrame = null;
         mcMessages.gotoAndPlay("Restart");
      }
      else
      {
         myGame.isGameOver = true;
         gameOver();
      }
   }
}
function updateScore()
{
   var _loc1_ = Number(mcScore.score1.text);
   if(myScore > _loc1_ + 20)
   {
      _loc1_ += 20;
   }
   else if(myScore > _loc1_ + 10)
   {
      _loc1_ += 10;
   }
   else if(myScore > _loc1_)
   {
      _loc1_ += 1;
   }
   var _loc2_ = "000000";
   mcScore.score1.text = _loc1_;
   mcScore.score2.text = _loc2_.substr(mcScore.score1.length) + _loc1_;
   if(myScore >= 1500 && hardcoreMode == false)
   {
      com.clubpenguin.util.Stamp.sendStamp(206);
   }
   if(myScore >= 2500 && hardcoreMode == false)
   {
      com.clubpenguin.util.Stamp.sendStamp(208);
   }
   if(myScore >= 3500 && hardcoreMode == false)
   {
      com.clubpenguin.util.Stamp.sendStamp(210);
   }
   if(myScore >= 5000 && hardcoreMode == true)
   {
      com.clubpenguin.util.Stamp.sendStamp(2202);
   }
   if(myScore >= 15000 && hardcoreMode == true)
   {
      com.clubpenguin.util.Stamp.sendStamp(2200);
   }
   if(myScore >= 10000 && hardcoreMode == true)
   {
      com.clubpenguin.util.Stamp.sendStamp(2201);
   }
   if(myScore >= 25000 && hardcoreMode == true)
   {
      com.clubpenguin.util.Stamp.sendStamp(2203);
   }
}
function quitGame()
{
   quit = true;
}
function gameOver(roomID)
{
   _global.getCurrentAirtower().removeListener("glb");
   var _loc4_;
   if(!gameOverCalled)
   {
      gameOverCalled = true;
      myGame.isGameOver = true;
      Key.removeListener(myKey);
      mcGame.onEnterFrame = null;
      _loc4_ = new Object();
      if(hardcoreMode)
      {
         _loc4_.score = Math.floor(myScore / 20);
         _loc4_.coins = Math.floor(myScore / 20);
      }
      else
      {
         _loc4_.score = Math.floor(myScore / 10);
         _loc4_.coins = Math.floor(myScore / 10);
      }
      if(roomID == undefined)
      {
         _root.showWindow("Game Over",_loc4_);
      }
      else
      {
         _root.showWindow("Game Over",_loc4_,roomID);
      }
      firstTime = false;
      OPJ.stopGame();
      if(quit)
      {
         OPJ.sendGameScore("quit",Number(myScore),Number(_loc4_.coins));
      }
      else if(roomID != undefined)
      {
         OPJ.sendGameScore("win",Number(myScore),Number(_loc4_.coins));
      }
      else
      {
         OPJ.sendGameScore("lose",Number(myScore),Number(_loc4_.coins));
      }
   }
}
function sendPufflePowerStamp()
{
   com.clubpenguin.util.Stamp.sendStamp(228);
   OPJ.sendStampOpcodes(228);
}
function playBackgroundSound()
{
   this.createEmptyMovieClip("bgSoundClip",this.getNextHighestDepth());
   if(volume == undefined)
   {
      volume = 75;
   }
   backroundSound = new Sound(this.bgSoundClip);
   backroundSound.attachSound("backgroundLoop");
   backroundSound.setVolume(volume);
   backroundSound.start(0,99);
}
myLives = 4;
myScore = 0;
mySeg = 0;
myLastSafeSeg = 0;
mcGame = game_mc;
mcCart = game_mc.cart_mc;
mcScore = score_mc;
mcPoint = point_mc;
mcLives = lives_mc;
mcMessages = messages_mc;
mcLives._visible = false;
mcScore._visible = false;
wobbling = false;
numTricksInCart = 0;
numTricksOutCart = 0;
numUniqueTricks = 0;
numGrindCorners = 0;
numSurfCorners = 0;
numTricksWithPuffle = 0;
numFlipsInRow = 0;
tricksDone = new Object();
hasPuffle = true;
gameOverCalled = false;
hardcoreMode = false;
var quit = false;
var SHELL = _global.getCurrentShell();
var airtower = _global.getCurrentAirtower();
var firstTime = true;
var OPJ = new com.disney.games.cartsurfer.OpcodeJournal();
var playerId = SHELL.getMyPlayerId();
if(playerId == undefined)
{
   playerId = -1;
}
OPJ.init(playerId);
if(_root.myPlayer.Hand == 752)
{
   hasPuffle = true;
   OPJ.sendFeatureOpcodes("black_puffle");
}
mineHolder = new Array([1,1,4,2,1,5,3,1,1,4,2,5,3,1,1,1,4,2,4,2,1,1,5,3,5,3,1,1,6],[1,1,5,3,1,4,2,5,3,1,4,2,1,1,1,4,2,1,5,3,4,2,1,1,5,3,1,1,6],[1,1,1,5,3,1,1,1,4,2,1,4,2,1,5,3,4,2,1,5,3,1,4,2,5,3,1,1,6],[1,1,5,3,1,4,2,1,1,4,2,1,5,3,1,4,2,5,3,5,3,1,1,4,2,4,2,1,1,6],[1,1,1,5,3,4,2,1,4,2,1,1,5,3,1,5,3,4,2,1,5,3,1,1,4,2,1,1,6]);
mineArray = mineHolder[random(5)];
_root.LocaleText = com.clubpenguin.util.LocaleText;
var SHELL = _global.getCurrentShell();
var listener = new Object();
listener.onLoadComplete = function()
{
   com.clubpenguin.util.Loader.removeEventListener(listener);
   playBackgroundSound();
   var _loc2_ = com.clubpenguin.util.LocaleText.getGameDirectory();
   var _loc3_ = "lang/" + com.clubpenguin.util.LocaleText.getLocale(com.clubpenguin.util.LocaleText.getLocaleID(com.clubpenguin.util.LocaleText.LANG_ID_PT)) + "/";
   var _loc4_ = new MovieClipLoader();
   window_mc.start_screen.instructions_txt.text = _root.LocaleText.getText("ui_instruction");
   window_mc.start_screen.play_txt.text = _root.LocaleText.getText("ui_play");
   window_mc.start_screen.instructions_mc.play_txt.text = com.clubpenguin.util.LocaleText.getText("ui_play");
   window_mc.start_screen.instructions_mc.move_title.text = com.clubpenguin.util.LocaleText.getText("move_title");
   window_mc.start_screen.instructions_mc.stand_title.text = com.clubpenguin.util.LocaleText.getText("stand_title");
   window_mc.start_screen.instructions_mc.jump_title.text = com.clubpenguin.util.LocaleText.getText("jump_title");
   window_mc.start_screen.instructions_mc.crash_title.text = com.clubpenguin.util.LocaleText.getText("crash_title");
   window_mc.start_screen.instructions_mc.help_spacebar.text = com.clubpenguin.util.LocaleText.getText("help_spacebar");
   window_mc.start_screen.instructions_mc.move_shadow.text = com.clubpenguin.util.LocaleText.getText("move_title");
   window_mc.start_screen.instructions_mc.stand_shadow.text = com.clubpenguin.util.LocaleText.getText("stand_title");
   window_mc.start_screen.instructions_mc.jump_shadow.text = com.clubpenguin.util.LocaleText.getText("jump_title");
   window_mc.start_screen.instructions_mc.crash_shadow.text = com.clubpenguin.util.LocaleText.getText("crash_title");
   window_mc.start_screen.instructions_mc.move_content.text = com.clubpenguin.util.LocaleText.getText("move_content");
   window_mc.start_screen.instructions_mc.stand_content.text = com.clubpenguin.util.LocaleText.getText("stand_content");
   window_mc.start_screen.instructions_mc.jump_content.text = com.clubpenguin.util.LocaleText.getText("jump_content");
   window_mc.start_screen.instructions_mc.crash_content.text = com.clubpenguin.util.LocaleText.getText("crash_content");
   score_mc.score_label.text = com.clubpenguin.util.LocaleText.getText("score_score");
};
var BLACK_PUFFLE_ID = 752;
var player = SHELL.getMyPlayerObject();
if(player.hand == BLACK_PUFFLE_ID)
{
   window_mc.start_screen.penguin_cart_screen.puffle_mc._visible = true;
   window_mc.start_screen.instructions_mc.puffle._visible = true;
   window_mc.start_screen.instructions_mc.puffle_fall._visible = true;
}
else
{
   window_mc.start_screen.penguin_cart_screen.puffle_mc._visible = false;
   window_mc.start_screen.instructions_mc.puffle._visible = false;
   window_mc.start_screen.instructions_mc.puffle_fall._visible = false;
}
com.clubpenguin.util.Loader.addEventListener(listener);
stop();
