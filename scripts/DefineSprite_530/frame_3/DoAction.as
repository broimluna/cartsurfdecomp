function handleGetLeaderboardData(data)
{
   var _loc12_ = Number(data[1]);
   var _loc14_ = Number(data[2]);
   var _loc11_ = String(data[3]);
   var _loc13_ = Number(data[4]);
   if(_loc12_ !== 905)
   {
      return undefined;
   }
   var _loc6_ = _loc11_.split(",");
   var _loc1_;
   var _loc8_;
   var _loc4_;
   var _loc3_;
   var _loc5_;
   var _loc7_;
   var _loc2_;
   for(var _loc9_ in _loc6_)
   {
      _loc1_ = _loc6_[_loc9_].split("|");
      _loc8_ = _loc1_[0];
      _loc4_ = _loc1_[1];
      _loc3_ = _loc1_[2];
      _loc5_ = _loc1_[3];
      _loc7_ = _loc1_[4];
      _loc2_ = leaderboard_mc.board.data_clips["p" + _loc3_];
      _loc2_._visible = true;
      _loc2_.name.text = _loc4_;
      _loc2_.rank.text = formatRank(_loc3_);
      _loc2_.score.text = _loc5_;
   }
   leaderboard_mc.loading._visible = false;
   leaderboard_mc.board.data_clips._visible = true;
}
function clearLeaderboard()
{
   var _loc1_ = 0;
   while(_loc1_ < 12)
   {
      _loc1_ = _loc1_ + 1;
      leaderboard_mc.board.data_clips["p" + _loc1_]._visible = false;
   }
}
function formatRank(rank)
{
   switch(Number(rank))
   {
      case 1:
         return rank + "st";
      case 2:
         return rank + "nd";
      case 3:
         return rank + "rd";
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
         return rank + "th";
      default:
   }
}
stop();
trace("GET LEADERBOARD");
var airtower = _global.getCurrentAirtower();
var shell = _global.getCurrentShell();
leaderboard_mc.loading._visible = true;
leaderboard_mc.loading.loading_bg.useHandCursor = false;
leaderboard_mc.board.data_clips._visible = false;
clearLeaderboard();
airtower.send("s","lb#glb",[],"str",shell.getCurrentServerRoomId());
airtower.addListener("glb",handleGetLeaderboardData);
