with Soccer.Core_Event;
use Soccer.Core_Event;
with Soccer.TeamPkg; use Soccer.TeamPkg;

package Soccer.Core_Event.Motion_Core_Event is

   type Motion_Event is abstract new Event with private;
   type Motion_Event_Ptr is access all Motion_Event'Class;

   procedure Serialize (E : Motion_Event; Serialized_Obj : out JSON_Value);

   procedure Initialize (E : in out Motion_Event;
                         nPlayer_Id : in Integer;
                         nPlayer_Number : in Integer;
                         nPlayer_Team : Team_Id;
                         nFrom : in Coordinate;
                         nTo : in Coordinate);

   function Get_Player_Id (E : in Motion_Event) return Integer;
   function Get_Player_Number (E : in Motion_Event) return Integer;
   function Get_Player_Team (E : in Motion_Event) return Team_Id;
   function Get_From (E : in Motion_Event) return Coordinate;
   function Get_To (E : in Motion_Event) return Coordinate;

private

   type Motion_Event is abstract new Event with
      record
         Player_Id : Integer;
         Player_Number : Integer;
         Player_Team : Team_Id;
	 From : Coordinate;
	 To : Coordinate;
   end record;

end Soccer.Core_Event.Motion_Core_Event;
