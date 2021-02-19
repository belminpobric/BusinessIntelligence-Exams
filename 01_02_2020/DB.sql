use transakcije
go

create table employee
(
PersonID int constraint PK_employee primary key,
IsPermittedToLogon bit,
IsSalesperson bit,
str_jez bit,
god_zap int
)
insert into employee
select ap.PersonID,ap.IsPermittedToLogon,ap.IsSalesperson,
		case 
		when CHARINDEX('[]',CustomFields,1) != 0 then 0
		when CHARINDEX('[]',CustomFields,1) = 0 then 1
		end,
		cast((substring(CustomFields,CHARINDEX('HireDate',CustomFields,1)+11,4)) as int)
		
from Application.People as ap where IsEmployee = 1 

select * from employee

alter table Sales.CustomerTransactions
add constraint FK_employe_custtransactions foreign key(LastEditedBy) references employee(PersonID)

go

create view ta_types_stock
as
select att.TransactionTypeID,att.TransactionTypeName,wst.TransactionOccurredWhen,wst.Quantity
from Warehouse.StockItemTransactions as wst inner join Application.TransactionTypes as att on wst.TransactionTypeID = att.TransactionTypeID

select * from ta_types_stock