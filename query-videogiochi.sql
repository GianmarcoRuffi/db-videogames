--QUERY SELECT

--1- Selezionare tutte le software house americane (3)

--select *
--from software_houses;

--2- Selezionare tutti i giocatori della città di 'Rogahnland' (2)

--select * 
--from players WHERE players.city='Rogahnland';

--3- Selezionare tutti i giocatori il cui nome finisce per "a" (220)

--select * 
--from players WHERE players.name like '%a'

--4- Selezionare tutte le recensioni scritte dal giocatore con ID = 800 (11)

--SELECT message, title, rating
--FROM reviews
--WHERE player_id = 800

--5- Contare quanti tornei ci sono stati nell'anno 2015 (9)

--SELECT COUNT(id)
--FROM tournaments
--WHERE year = 2015

--6- Selezionare tutti i premi che contengono nella descrizione la parola 'facere' (2)

--select * 
--from awards WHERE awards.description like '%facere%'

--7- Selezionare tutti i videogame che hanno la categoria 2 (FPS) o 6 (RPG), mostrandoli una sola volta (del videogioco vogliamo solo l'ID) (287)

--SELECT DISTINCT  videogame_id
--FROM category_videogame
--WHERE category_id = 2 OR category_id = 6

--8- Selezionare tutte le recensioni con voto compreso tra 2 e 4 (2947)

--SELECT *
--FROM reviews
--WHERE rating BETWEEN 2 AND 4

--9- Selezionare tutti i dati dei videogiochi rilasciati nell'anno 2020 (46)

--SELECT *
--FROM videogames
--WHERE release_date BETWEEN '01/01/2020' AND '31/12/2020'

--10- Selezionare gli id dei videogame che hanno ricevuto almeno una recensione da 5 stelle, mostrandoli una sola volta (443)

--SELECT DISTINCT videogame_id
--FROM reviews
--WHERE rating = 5

--*********** BONUS ***********

--11- Selezionare il numero e la media delle recensioni per il videogioco con ID = 412 (review number = 12, avg_rating = 3)

--12- Selezionare il numero di videogame che la software house con ID = 1 ha rilasciato nel 2018 (13


--QUERY CON GROUPBY

--1- Contare quante software house ci sono per ogni paese (3)

--SELECT COUNT(id)
--FROM software_houses
--group by country

--2- Contare quante recensioni ha ricevuto ogni videogioco (del videogioco vogliamo solo l'ID) (500)

--SELECT COUNT(videogame_id)
--FROM reviews
--group by videogame_id

--3- Contare quanti videogiochi hanno ciascuna classificazione PEGI (della classificazione PEGI vogliamo solo l'ID) (13)

--SELECT COUNT(videogame_id)
--FROM pegi_label_videogame
--group by pegi_label_id

--4- Mostrare il numero di videogiochi rilasciati ogni anno (11)

--SELECT DATEPART(year, release_date) year, COUNT(*) 
--FROM videogames
--group by DATEPART(year, release_date);

--5- Contare quanti videogiochi sono disponbiili per ciascun device (del device vogliamo solo l'ID) (7)

--select count (videogame_id)
--from device_videogame
--group by device_id

--6- Ordinare i videogame in base alla media delle recensioni (del videogioco vogliamo solo l'ID) (500)

--select videogame_id, avg(rating) as [rating]
--from reviews
--group by videogame_id
--order by videogame_id;

--QUERY CON JOIN

--1- Selezionare i dati di tutti giocatori che hanno scritto almeno una recensione, mostrandoli una sola volta (996)

--select distinct players.*
--from players
--join reviews
--on reviews.player_id = players.id


--2- Sezionare tutti i videogame dei tornei tenuti nel 2016, mostrandoli una sola volta (226)

--Select distinct videogames.id, videogames.name
--from tournaments
--join tournament_videogame ON tournament_videogame.tournament_id = tournaments.id
--join videogames on tournament_videogame.videogame_id = videogames.id
--WHERE tournaments.year = 2016;

--3- Mostrare le categorie di ogni videogioco (1718)

--select videogames.id, (videogames.name)videogioco, (categories.name) categoria
--from videogames
--join category_videogame
--on videogames.id = category_videogame.videogame_id
--join categories
--on category_videogame.category_id = categories.id

--4- Selezionare i dati di tutte le software house che hanno rilasciato almeno un gioco dopo il 2020, mostrandoli una sola volta (6)

--select distinct software_houses.*
--from software_houses
--join videogames
--on software_houses.id = videogames.software_house_id
--where videogames.release_date > '2020'

--5- Selezionare i premi ricevuti da ogni software house per i videogiochi che ha prodotto (55)

--SELECT software_houses.id, software_houses.name, awards.id, awards.name
--FROM software_houses
--INNER JOIN videogames
--ON software_houses.id = videogames.software_house_id
--INNER JOIN award_videogame
--ON videogames.id = award_videogame.videogame_id
--INNER JOIN awards
--ON award_videogame.award_id = awards.id
--ORDER BY software_houses.name;

--6- Selezionare categorie e classificazioni PEGI dei videogiochi che hanno ricevuto recensioni da 4 e 5 stelle, mostrandole una sola volta (3363)

--SELECT distinct videogames.name, (categories.name)categoria, (pegi_labels.name)classificazione_pegi
--FROM categories
--INNER JOIN category_videogame
--ON categories.id = category_videogame.category_id
--INNER JOIN videogames
--ON category_videogame.videogame_id = videogames.id
--INNER JOIN pegi_label_videogame
--ON videogames.id = pegi_label_videogame.videogame_id
--INNER JOIN pegi_labels
--ON pegi_label_videogame.pegi_label_id = pegi_labels.id
--INNER JOIN reviews
--ON videogames.id = reviews.videogame_id
--WHERE reviews.rating between 4 AND 5;

--7- Selezionare quali giochi erano presenti nei tornei nei quali hanno partecipato i giocatori il cui nome inizia per 'S' (474)

SELECT DISTINCT videogames.id, (videogames.name)nome_videogioco
FROM videogames
INNER JOIN tournament_videogame
ON videogames.id = tournament_videogame.videogame_id
INNER JOIN tournaments
ON tournament_videogame.tournament_id = tournaments.id
INNER JOIN player_tournament
ON tournaments.id = player_tournament.tournament_id
INNER JOIN players
ON player_tournament.player_id = players.id
WHERE players.name LIKE 'S%';

--8- Selezionare le città in cui è stato giocato il gioco dell'anno del 2018 (36)

--9- Selezionare i giocatori che hanno giocato al gioco più atteso del 2018 in un torneo del 2019 (3306)


--*********** BONUS ***********

--10- Selezionare i dati della prima software house che ha rilasciato un gioco, assieme ai dati del gioco stesso (software house id : 5)

--11- Selezionare i dati del videogame (id, name, release_date, totale recensioni) con più recensioni (videogame id : 398)

--12- Selezionare la software house che ha vinto più premi tra il 2015 e il 2016 (software house id : 1)

--13- Selezionare le categorie dei videogame i quali hanno una media recensioni inferiore a 1.5 (10)