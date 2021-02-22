use transakcije
go
create table employee1
(
PersonID int constraint PK_employee1 primary key,
IsPermittedToLogon bit not null,
IsEmployee bit not null,
firma nvarchar(40),
valid_god_ind int
)
insert into employee1
select ap.PersonID,ap.IsPermittedToLogon,ap.IsEmployee,left(ap.EmailAddress,CHARINDEX('@',ap.EmailAddress,1)-1),
		case
			when year(ap.ValidFrom)=2013 or year(ap.ValidFrom)=2014 then 1
			when year(ap.ValidFrom)=2015 or year(ap.ValidFrom)=2016 then 2
		end
from Application.People as ap
go

select * from employee1

go

alter table Purchasing.SupplierTransactions
add constraint FK_SP_employee foreign key(LastEditedBy) references employee1(PersonID)

go

create view inv_cust
as
select si.SalespersonPersonID,sc.CustomerName,sc.CreditLimit,sc.AccountOpenedDate
from Sales.Invoices as si inner join Sales.Customers as sc on si.CustomerID = sc.CustomerID

select * from inv_cust