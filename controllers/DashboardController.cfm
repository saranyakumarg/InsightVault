<cfscript>
variables.userModel = createObject("component", application.baseURL & "models.UserModel")>
variables.categoryModel = createObject("component", application.baseUrl & "models.CategoryModel")>
variables.TagModel=createObject("component",application.baseUrl & "models.TagModel")>
variables.userId= session.user.user_id>
variables.userModel.getTotalUserCount(user_id=variables.userId,type="pending")>
variables.pendinguserCount=variables.userModel.getTotalUserCount(user_id=userId,type="default")>
variables.categoryCount = variables.categoryModel.getTotalCategoryCount()> 
variables.tagCount = variables.TagModel.getTotalTagsCount()>
</cfscript>