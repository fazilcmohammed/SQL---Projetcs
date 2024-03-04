--1. Extract information on pets names and owner names side-by-side
select 
	p.Name pet_name,
	concat(o.Name, ' ', o.Surname) owner_name
from pets p
join owners o 
on p.ownerid = o.ownerid
order by pet_name
