<cfif structKeyExists(url, "method")>
    <cfsetting enablecfoutputonly="true" />
    <cfsetting showDebugOutput="false">
</cfif>

<cfscript>
    variables.auditLogModel = createObject("component", application.baseURL & "models.AuditLogModel");

    if(structKeyExists(url, "method")){
        switch(url.method){
            case "get-Logs":
                getLogs();
                break;
            default:
                writeOutput(serializeJSON({"success":false,"message":"unkknown method" &url.method}));
                break;
        }
    }

    function getLogs(){
        var draw = structKeyExists(url, "draw") ? url.draw : 0;
        var start= structKeyExists(url, "start") ? url.start : 0;
        var length=structKeyExists(url, "length") ? url.length : 8;
        var searchValue = structKeyExists(url, "search[value]") ? url["search[value]"] : "";
        var orderColumnIndex = structKeyExists(url, "order[0][column]") ? url["order[0][column]"] : "0";
        var orderDir = structKeyExists(url, "order[0][dir]") ? url["order[0][dir]"] : "asc";
        var columnMap = ["log_id","entity_type"];
        var orderColumn = columnMap[orderColumnIndex +1];
        var totalRecords = variables.auditLogModel.getTotalLogsCount();
        var Logs = variables.auditLogModel.getLogs(draw, start, length,searchValue, orderColumn, orderDir, columnMap,totalRecords);
    //    writeDump(Logs);abort;
        var data=[];
        for (var i=1; i <=Logs.recordCount; i++) {
            var Log = {
                "log_id": Logs["log_id"][i],
                "user_id":  Logs.first_name[i] & " " & Logs.last_name[i],
                "role_id":Logs.name[i],
                "action":Logs["action"][i],
                "entity_type":Logs["entity_type"][i],
                "access_level_id":Logs.name[i],
                "details":Logs["details"][i]
            };

            arrayAppend(data, { 
                "log_id": Log.log_id,
                "user_id":Log.user_id,
                "role_id":Log.role_id,
                "action":Log.action,
                "entity_type":Log.entity_type,
                "access_level_id":Log.access_level_id,
                "details":Log.details
            });
        }
        writeOutput(serializeJSON({
            "draw": draw,
            "recordsTotal": totalRecords,
            "recordsFiltered": totalRecords,
            "data":data
        }));
    }

</cfscript>