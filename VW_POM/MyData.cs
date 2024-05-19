using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SQLOperations;
namespace VW_POM
{
    public class MyData
    {
        public static MSSQLServerLowLevel _SQLOperations = new MSSQLServerLowLevel("hncrsap-sql01", "HEDS", "hedsDB", "HedsDB214");
        public static MSSQLServerLowLevel _SQLOperationsKL = new MSSQLServerLowLevel("192.168.155.13", "HIMES_HEDS", "PlantMachine", "plantmachine1015");
        public static MSSQLServerLowLevel _SQLOperationsKL2 = new MSSQLServerLowLevel("192.168.155.13", "HIMES_HEDS", "PlantSupport", "plantsupport1522");
    }
}