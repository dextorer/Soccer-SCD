
with AWS.Config.Set;
with AWS.Server;

with Soccer.Server.Callbacks;
with Soccer.Server.WebSockets;

with AWS;
with AWS.Net.WebSocket.Registry.Control;
with AWS.Response;
with AWS.Status;
with Ada;
with Ada.Text_IO;
with GNATCOLL.JSON; use GNATCOLL.JSON;

package Soccer.Server.WebServer is

   use AWS;
   use AWS.Config;
   use type AWS.Net.Socket_Access;

   Web_Server : AWS.Server.HTTP;
   Web_Config : Config.Object;

   -- WebSockets configuration

   ManagerVisitors : Net.WebSocket.Registry.Recipient :=
     Net.WebSocket.Registry.Create (URI => "/managerVisitors/registerForStatistics");

   ManagerHome : Net.WebSocket.Registry.Recipient :=
     Net.WebSocket.Registry.Create (URI => "/managerHome/registerForStatistics");

   Field : Net.WebSocket.Registry.Recipient :=
     Net.WebSocket.Registry.Create (URI => "/field/registerForEvents");

   -- Starts the WebServer

   procedure Start ;

   -- Updates both managers

   procedure PublishManagersUpdate (events : JSON_Array);

   -- Send team stats to both managers
   procedure PublishManagerTeams (team1 : String; team2 : String);

   -- Sends quit signal to both managers
   procedure SendQuitSignalsToManagers;

   -- Updates the field

   procedure PublishFieldUpdate (events : JSON_Array);

   procedure Notify_Field_With_Params (payload : String);

   procedure PublishTestUpdate;

end Soccer.Server.WebServer;
