with Soccer.Manager_Event;

package Soccer.Manager_Event.Substitution is

   type Substitution_Event is new Event with private;
   type Substitution_Event_Ptr is access all Substitution_Event'Class;

   procedure Deserialize (E : out Substitution_Event; Serialized_Obj : in JSON_Value);

   procedure Initialize (e : in out Substitution_Event_Ptr; team : Team_Id; id_1 : Integer; id_2 : Integer);

   package Substitutions_Container is new Vectors (Index_Type   => Natural,
						   Element_Type => Substitution_Event_Ptr);

   procedure Set_Correct_Ids (e : Substitution_Event_Ptr; id_1 : Integer; id_2 : Integer; id_2_number : Integer);

   procedure Get_Numbers (e : in Substitution_Event_Ptr; id_1 : out Integer; id_2 : out Integer);

   function Get_Backup_Number (e : in Substitution_Event_Ptr) return Integer;

   function Get_Team (e : in Substitution_Event_Ptr) return Team_Id;

private

   type Substitution_Event is new Event with
      record
	 team : Team_Id;
         player_1_id     : Integer;
         player_2_id     : Integer;
         player_2_number : Integer;
      end record;

end Soccer.Manager_Event.Substitution;
