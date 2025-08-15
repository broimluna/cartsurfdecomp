class com.clubpenguin.util.Stamp
{
   static var debug = false;
   static var stamps = new Object();
   function Stamp()
   {
   }
   static function sendStamp($id)
   {
      trace("STAMPPPP " + $id);
      var _loc3_;
      if(com.clubpenguin.util.Stamp.debug)
      {
         com.clubpenguin.util.Stamp.stamps[$id] = true;
      }
      else
      {
         _loc3_ = _global.getCurrentShell();
         _loc3_.stampEarned($id);
      }
   }
   static function checkStamp($id)
   {
      var _loc2_;
      if(com.clubpenguin.util.Stamp.debug)
      {
         if(com.clubpenguin.util.Stamp.stamps[$id])
         {
            return true;
         }
         return false;
      }
      var _loc3_ = _global.getCurrentShell();
      _loc2_ = _loc3_.stampIsOwnedByMe($id);
      return _loc2_;
   }
   static function setDebug(mode)
   {
      com.clubpenguin.util.Stamp.debug = mode;
   }
   static function getDebug()
   {
      return com.clubpenguin.util.Stamp.debug;
   }
   static function clearStamps()
   {
      com.clubpenguin.util.Stamp.stamps = new Object();
   }
   static function setStamps(new_stamps)
   {
      var _loc1_;
      for(var _loc3_ in new_stamps)
      {
         _loc1_ = new_stamps[_loc3_];
         com.clubpenguin.util.Stamp.stamps[_loc1_] = true;
      }
   }
}
