<cfif structKeyExists(url, "method")>
    <cfsetting enablecfoutputonly="true" />
    <cfsetting showDebugOutput="false">
</cfif>
<cfscript>
    //get category model
    variables.categoryModal = createObject("component", application.baseUrl & "models.CategoryModal");
    if(structKeyExists(url, "method")){
        switch(url.method){
            case "get-category":
                getCategory();
                break;
            default:
                writeOutput(serializeJSON({ "success": false, "message": "Unknown method: " & url.method }));
                break;
        }
    }

    function getCategory(){
        var draw = structKeyExists(url, "draw") ? url.draw : 0;
        var start= structKeyExists(url, "start") ? url.start : 0;
        var length=structKeyExists(url, "length") ? url.length : 8;
        var searchValue = structKeyExists(url, "search[value]") ? url["search[value]"] : "";
        var orderColumnIndex = structKeyExists(url, "order[0][column]") ? url["order[0][column]"] : "0";
        var orderDir = structKeyExists(url, "order[0][dir]") ? url["order[0][dir]"] : "asc";
        var columnMap = ["category_id", "name", "slug"];
        var orderColumn = columnMap[orderColumnIndex +1];
        var totalRecords = variables.categoryModal.getTotalCategoryCount();
        var categories = variables.categoryModal.getCategory(draw, start, length,searchValue, orderColumn, orderDir, columnMap,totalRecords);
        var data=[];
        for (var i=1; i <=categories.recordCount; i++) {
            var category = {
                "category_id": categories["category_id"][i],
                "name": categories["name"][i],
                "slug": categories["slug"][i]
            };
            var actions=categories["name"][i];
            arrayAppend(data, {
                "category_id": category.category_id,
                "name": category.name,
                "slug":category.slug
        
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