with Soccer.Core_Event.Motion_Core_Event;
with Ada.Text_IO; use Ada.Text_IO;

package body Soccer.Core_Event.Motion_Core_Event is

   function Get_Player_Id (E : in Motion_Event) return Integer is
   begin
      return E.Player_Id;
   end Get_Player_Id;
   function Get_From (E : in Motion_Event) return Coordinate is
   begin
      return E.From;
   end Get_From;
   function Get_To (E : in Motion_Event) return Coordinate is
   begin
      return E.To;
   end Get_To;

   procedure Initialize (E : in out Motion_Event;
                         nPlayer_Id : in Integer;
                         nFrom : in Coordinate;
                         nTo : in Coordinate) is
   begin
      E.Player_Id := nPlayer_Id;
      E.From := nFrom;
      E.To := nTo;
   end Initialize;

   procedure Serialize (E : Motion_Event; Serialized_Obj : out JSON_Value) is
   begin
      Serialized_Obj := Create_Object;
      Serialized_Obj.Set_Field(Field_Name => "player_id",
                               Field      => E.Player_Id);
      Serialized_Obj.Set_Field(Field_Name => "from_x",
                               Field      => E.From.coord_x);
      Serialized_Obj.Set_Field(Field_Name => "from_y",
                               Field      => E.From.coord_y);
      Serialized_Obj.Set_Field(Field_Name => "to_x",
                               Field      => E.To.coord_x);
      Serialized_Obj.Set_Field(Field_Name => "to_y",
                               Field      => E.To.coord_x);
   end Serialize;

end Soccer.Core_Event.Motion_Core_Event;
