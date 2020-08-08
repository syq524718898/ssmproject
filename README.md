# ssmproject
Account information management system integrated with SSM



`MySQL version requirements：above 8.0`

Data preparation

```sql
 create database ssm_project;
 use ssm_project;
 create table account(id int primary key auto_increment,name varchar(20),money float);
```

```sql
insert into account values(null,"jack",2000),(null,"marry",3000),(null,"kasa",1500),(null,"lina",4000),(null,"mack",5000),(null,"linda",6000),(null,"tina",4000),(null,"ethan",6000),(null,"james",3000),(null,"noah",7000),(null,"samuel",5500),(null,"jack",4000);
```

