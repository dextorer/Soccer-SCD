with Ada.Containers.Vectors;
use Ada.Containers;
with Soccer.Core_Event.Motion_Core_Event;
use Soccer.Core_Event.Motion_Core_Event;

with Soccer.TeamPkg;
use Soccer.TeamPkg;

package Soccer.ControllerPkg is

   -- New Types

   type Action is
      record
         event : Motion_Event_Prt;
         utility : Utility_Range;
      end record;

   type PlayerStatus is
      record
         id : Integer;
         team : Team_Ptr;
         running : Boolean := False;
         on_the_field : Boolean := False;
         mCoord : Coordinate := Coordinate'(coordX => 0,
                                            coordY => 0);
         distance : Integer;
      end record;

   package Players_Container is new Vectors (Index_Type   => Natural,
                                             Element_Type => PlayerStatus);
   use Players_Container;

   type ReadResultType is
      record
         playersInMyZone : Vector;
         holder_id : Integer;
      end record;
   type ReadResult is access ReadResultType;

   type Generic_Status is
      record
         coord : Coordinate;
         holder : Boolean;
         nearby : Boolean;
      end record;
   type Generic_Status_Ptr is access Generic_Status;

   -- Functions, Procedure, ecc...

   function Get_Generic_Status (id : in Integer) return Generic_Status_Ptr;

   function readStatus (x : in Integer; y : in Integer; r : in Integer) return ReadResult;

   task Field_Printer;

   Num_Of_Zone : Integer := 3;

   type Fields_Zone is new Integer range 1 .. Num_Of_Zone;

   task Controller is
      entry Write(mAction : in out Action);
   private
      entry Awaiting(Fields_Zone)(mAction : in out Action);
   end Controller;

end Soccer.ControllerPkg;
