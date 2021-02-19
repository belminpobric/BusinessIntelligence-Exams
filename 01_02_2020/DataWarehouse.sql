create database IB123456_DW
go

use IB123456_DW
go
create table dim_employee
(
dim_employee_id int constraint PK_dim_employee primary key identity(1,1),
PersonID int,
IsPermittedToLogon bit,
IsSalesperson bit,
str_jez bit,
god_zap int
)
create table dim_invoice_customers
(
dim_invoice_customers_id int constraint PK_dic primary key identity(1,1),
InvoiceID int,
CustomerName nvarchar(100),
CreditLimit decimal(18,2),
br_dana_razl int
)
create table dim_ta_types
(
dim_ta_types int constraint PK_dimtt primary key identity(1,1),
TransactionTypeID int,
TransactionTypeName nvarchar(50),
ValidFrom datetime2(7)
)
create table fact_CustTrans
(
fact_CustTrans_id int constraint PK_fact_custtrans primary key identity(1,1),
FinalizationDate date,
AmountExcludingTax decimal(18,2),
TaxAmount decimal(18,2),
TransactionAmount decimal(18,2),
dim_invoice_customers_id int constraint FK_fact_dim_inv_cust foreign key references dim_invoice_customers(dim_invoice_customers_id),
dim_employee_id int constraint FK_fact_dim_emp foreign key references dim_employee(dim_employee_id),
dim_ta_types int constraint FK_fact_dim_ta_types foreign key references dim_ta_types(dim_ta_types),


)
