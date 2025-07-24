<cfscript>
variables.userModel = createObject("component", application.baseURL & "models.UserModel");
variables.categoryModel = createObject("component", application.baseUrl & "models.CategoryModel");
variables.TagModel=createObject("component",application.baseUrl & "models.TagModel");
variables.userId= session.user.user_id;
variables.userCount=variables.userModel.getTotalUserCount(user_id=variables.userId,type="default");
variables.pendinguserCount=variables.userModel.getTotalUserCount(user_id=variables.userId,type="pending");
variables.pendingContentCount=variables.categoryModel.getTotalContentCount(type="pending");
variables.contentCount = variables.categoryModel.getTotalContentCount(type="default");
variables.categoryCount = variables.categoryModel.getTotalCategoryCount();
variables.tagCount = variables.TagModel.getTotalTagsCount();
</cfscript>