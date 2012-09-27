This is customization on "DAO generator for PHP and Mysql"(http://phpdao.com).  
It includes:  
* All members of Data transfer objects are private with getter/setter.
* Data access Object have insert method where developers can specify primary key.
* Bugfix for phpdoc.

### How to use (same as original)
1. Put all files somewhere your borwser can access.
2. Modify /templates/class/dao/sql/ConnectionProperty.class.php to fit your database
3. Ensure each table in your database have at least one data
4. Kick generate.php from browser
5. All files are generated in /generated folder

