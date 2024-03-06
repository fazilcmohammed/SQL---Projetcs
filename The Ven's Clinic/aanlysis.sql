--A. KPIs
--1.Ttotal pets treated
select count(distinct PetID) from procedureshistory

--2. Total revenue generated
select sum(price) from procedures

--3. Available procedure types in clinic
select distinct proceduretype from procedures

--B. Extract information on pets names and owner names side-by-side
select 
	p.Name pet_name,
	concat(o.Name, ' ', o.Surname) owner_name
from pets p
join owners o 
on p.ownerid = o.ownerid
order by pet_name

--C. Find out which pets from this clinic had procedures performed
select 
	ph.PetID pet_id,
	p.Name pet_name,
	p.Kind pet_kind
from procedureshistory ph
join pets p on ph.PetID = p.PetID

--D. Match up all procedures performed to their descriptions.
select 
	ph.PetID pet_id,
	p.Name pet_name,
	p.Kind pet_kind,
	ph.ProcedureType procedure_type,
	pd.description,
	ph.Date
from procedureshistory ph
join pets p on ph.PetID = p.PetID
join proceduresdetails pd 
on ph.ProcedureSubCode = pd.ProcedureSubCode

--E. Extract a table of individual costs (procedure prices) incurred by owners of pets from the clinic in question (this table should have owner and procedure price side -by-side)
--creating view
create view ownerpet as
select 
	o.OwnerID owner_id,
	CONCAT(o.Name, ' ', o.Surname) owner_name,
	p.PetID pet_id,
	p.Name pet_name,
	p.Kind pet_kind
from owners o
join pets p 
on o.OwnerID = p.OwnerID

create view procedures as
select 
	ph.PetID pet_id,
	ph.ProcedureSubCode proceduresubcode,
	ph.ProcedureType proceduretype,
	pd.Description description,
	pd.price price,
	ph.Date date
from procedureshistory ph
join proceduresdetails pd 
on ph.ProcedureSubCode = pd.ProcedureSubCode

select
	op.pet_id pet_id,
	op.owner_name,
	sum(p.price) price
from ownerpet op
join procedures p on op.pet_id = p.pet_id
group by op.pet_id, op.owner_name

--F. pets treated
select 
pet_kind, count(p.pet_id) from ownerpet op
join procedures p on op.pet_id = p.pet_id
group by pet_kind

--G. Revenue per month
select MONTH(date) month, SUM(price) from procedures
group by MONTH(date)
order by month 
