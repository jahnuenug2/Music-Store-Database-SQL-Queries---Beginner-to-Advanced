1- Who is the senior most employee based on job title?
SELECT * FROM employee
ORDER BY levels desc
limit 1

2-Which country have the most invoices?
Select COUNT(*)as c,billing_country
from invoice
group by billing_country
order by c desc
limit 1

3- What are the top 3 values of total invoices?
select total from invoice
order by total desc
limit 3

4-Which city has the best customers?we would like to throw a promotional music festival in the city as we made the most money. 
Write a query that returns one city has the highest sum of the invoices total. 
Return both the city name and sum of the invoices?

select SUM(total) as invoice_total, billing_city 
from invoice
group by billing_city
order by invoice_total desc


5-Who is the best customer? The customer who has spent the most moneywill be declared the best customer.
So write a query that returns the person who has spent the most money?

Select customer.customer_id, customer.first_name, customer.last_name, SUM(invoice.total) as total
from customer
JOIN invoice ON customer.customer_id=invoice.customer_id
group by customer.customer_id
order by total desc
limit 1

------>moderate Questions
q1--Write query to return the email, first name, last name and genre of all the rock music listners.
---return your list ordered alphabetically by email starting with A?
select DISTINCT email, first_name, last_name
from customer
join invoice on customer.customer_id=invoice.customer_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
where track_id in(
    select track_id from track
	join genre on track.genre_id = genre.genre_id
	where genre.name like 'Rock'
)
order by email;

Q2--Lets invite the artist who have the most rock music in our dataset. 
---write a query that returns the artist name and the total track count of top 10 rock bands?
select artist.artist_id , artist.name, count(artist.artist_id) as number_of_songs
from track
join album on album.album_id = track.album_id
join artist on artist.artist_id = album.artist_id
join genre on genre.genre_id = track.genre_id
where genre.name like 'Rock'
group by artist.artist_id
order by number_of_songs desc
limit 10

Q3--Return all the track names that have a song length longer than the average song length
--return the name and milliseconds for each track, 
---order by the sings with the longest song listed first?
select name, milliseconds
from track
where milliseconds > (
	select avg(milliseconds) as avg_track_length
	from track)
order by milliseconds desc;	

---------Advance
Q1-- Find how much amount spent by each customer on artist?
---write a query to return customer name, artist name, and total spent?
with best_selling_artist as(
	select artist.artist_id as artist_id, artist.name as artist_name, sum(invoice_line.unit_price*invoice_line.quantity) as invoice
	from invoice_line
	join track on track.track_id = invoice_line.track_id
	join album on album.album_id = track.album_id
	join artist on artist.artist_id = album.artist_id
	group by 1
	order by 3 desc
	limit 1
)
select c.customer_id, c.first_name, c.last_name, bsa.artist_name, sum(il.unit_price*il.quantity) as amount_spent
from invoice i
join customer c on c.customer_id = i.customer_id
join invoice_line il on il.invoice_id = i.invoice_id
join track t on t.track_id = il.track_id
join album alb on alb.album_id = t.album_id
join best_selling_artist bsa on bsa.artist_id = alb.artist_id
group by 1,2,3,4
order by 5 desc


Q2--we want to find out the most popular music genre for each country, we determine the most popular genre as the genre with the highest amount od purchase.
---write a query that returns each country along with the top genre for the countries where the maximum number of purchase?
with popular_genre as 
(
	select count(invoice_line.quantity) as purchases, customer.country, genre.name, genre.genre_id,
	    row_number() over(partition by customer.country order by count(invoice_line.quantity) desc) as RowNo
	from invoice_line
	    join invoice on invoice.invoice_id = invoice_line.invoice_id
		join customer on customer.customer_id = invoice.customer_id
		join track on track.track_id = invoice_line.track_id
		join genre on genre.genre_id = track.genre_id
		group by 2,3,4
		order by 2 asc, 1 desc
)
select * from popular_genre where RowNo <= 1


Q3---Write a query that determines the customer that has spent the most on music for each country.
--write a query that returns the country along with the top customer and how much they spent, 
---For countries where the top amount spent it shared, provide all customers who spent this amount?
with customer_with_country as(
                select customer.customer_id, first_name, last_name, billing_country, sum(total) as total_spending,
              row_number() over(partition by billing_country order by sum(total)desc) as RowNo
				from invoice
				join customer on customer.customer_id = invoice.customer_id
							   group by 1,2,3,4
							   order by 4 asc, 5 desc)
select * from customer_with_country where RowNo <=1	
	

