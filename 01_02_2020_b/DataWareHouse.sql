create database IB123456_DW
go

use IB123456_DW
go

create table dim_employee
(
dim_employee_id int constraint PK_dim_employee primary key identity(1,1),
PersonID int,
IsPermittedToLogon bit,
IsEmployee bit,
firma nvarchar(40),
valid_god_int int
)
create table dim_payment_customer
(
dim_payment_customer_id int constraint PK_dim_payment_customer primary key identity(1,1),
PaymentMethodID int,
PaymentMethodName nvarchar(50),
CustomerID int,
TransactionDate date
)
create table dim_ta_types
(
dim_ta_types_id int constraint PK_dim_ta_types primary key identity(1,1),
TransactionTypeID int,
TransactionTypeName nvarchar(50),
ValidFrom datetime2(7)
)

create table fact_SuppTrans
(
fact_SuppTrans_id int constraint PK_fact_Supp_Trans primary key identity(1,1),
TransactionDate date,
AmountExcludingTax decimal(18,2),
TaxAmount decimal(18,2),
TransactionAmount decimal(18,2),
dim_employee_id int constraint FK_fact_dimemp foreign key references dim_employee(dim_employee_id),
dim_payment_customer_id int constraint FK_dim_payment_cust_fact foreign key references dim_payment_customer(dim_payment_customer_id),
dim_ta_types_id int constraint FK_dimttt_fact foreign key references dim_ta_types(dim_ta_types_id)
)