# DevTechTest_new


=========Notice: All contents hava nothing to do with the work of my service company.=============


# Techniques:
1: Platform & Tools

Server Middleware: SpringBoot

Date Store: MySql8.0

Dev Environment: Java8, Eclipse Java EE (2019-3), Maven(3.0), Tomcat(8.5)

2: Front End

JS framework: jQuery and native

CSS Style: flex

3: Back End

Framework: Java + Spring Boot

O/R M: JPA

Interface: REST apis

Log Tools: SLF4J

# How to run the project

Since it's just a small test, I designed the web application as s a single page website. After Running it on Server, it would open the eclipse browser on url (localhost:8080/gaofei/) after printing some content on the console.

or you may run the project by this steps:

1: The top of Menu, "Project" - "Clean"

2: Right click the Project Name( DevTechTest) - "Maven" - "Update Project" (Alt + F5)

3: Right click the Project Name( DevTechTest) - "Run As" - "Maven clean"

4: Right click the Project Name( DevTechTest) - "Run As" - "Maven install"

5: Right click the Project Name( DevTechTest) - "Run As" - "Run on Server"

5: Wait a monent ...

# Project Configuration

Open the file /src/main/resources/application.properties to change the datasource config as your environment. The default datasource config is following:

spring.datasource.username=root

spring.datasource.password=123

database_name = 127.0.0.1/test

# Function

The project can be compilied and built successfully, and reach almost all the function as mentioned in assignment, I just describle it in detail here.

● Filter and sort the list of customers.

--- Click the (List) button to show the customers info by some important fileds. 

--- You can also sort the customers by "Ascend" or (Descend) Id(field).

● Click on a customer in the list to view their details and add/edit notes for that

--- If you want to understand a customer in detail, click the "UserName" linked in the list to view the information in detail, you can add/edit notes for your clicked user.

● Change their status.

--- You can also choose the status of the user in the radio box.


# User Interface

editing customer details for status

---localhost:8080/gaofei/rest/v1/user/info/status/update

editing customer details for notes

---localhost:8080/gaofei/rest/v1/user/note/save


# DataBase Fields

dtt_admin

--- Can be ignored, since I don't show the login module on the page.

dtt-userinfo

--- Store the basic information associated with customer, including ID (Unique, main key), UserId, Name, contact details (Email, telephone), Status, Creation/visit data and time. 

--- Since a customer can have any number of notes associated with them, the notes are stored separately in another database.

dtt-usernote --- save the changes(add or edit) of customer notes

--- Store ID, UserId, Notes, Notes Creation time and others useless.

# Java Class

The project use a Java multi-tier architecture principle. 


--- Class for Basic information like Status

Controller -        UserInfoController

Service    -        IUserInfoService

Dao        -        UserInfoRepo


--- Class for Notes

Controller -        UserNoteController

Service    -        IUserNoteService

Dao        -        UserNoteRepo
