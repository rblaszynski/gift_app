; ; Rules for matching gifts with given preference
; ; Salience set to 1 so this rule will be fired at the end.
; ; (Other rules have salience = 2)
(defrule gifts-matching
	(declare (salience 1))
	(gift (ID ?ID) (name ?name) (sex ?sex) (age-level ?age) (price-level ?price) (cat-fashion ?fashion) (cat-music ?music) (cat-book ?book) (cat-games ?games) (cat-movies ?movies) (cat-gadgets ?gadgets) (cat-sport ?sport) (cat-cosmetics ?cosmetics) (cat-toy ?toy)
	(preference (sex "?"|?sex)
			(age-level "?"|?age)
			(price-level "?"|?price))
			(cat-fashion "?"|?fashion)
			(cat-music "?"|?music)
			(cat-book "?"|?book)
			(cat-games "?"|?games)
			(cat-movies "?"|?movies)
			(cat-gadgets "?"|?gadgets)
			(cat-sport "?"|?sport)
			(cat-cosmetics "?"|?cosmetics)
			(cat-toy "?"|?toy)
=>
	(printout t ?ID "," ?name "," ?sex "," ?age "," ?price ":" ?fashion "," ?music "," ?book "," ?games "," ?movies "," ?gadgets "," ?sport "," ?cosmetics "," ?toy ",")
)

; ; Rule of tuning "price-level"
(defrule tuning-price-level
	(declare (salience 2))
	?d <- (gift (ID ?id) (price-level ?origin))
	(suggestion (gift-id ?id) (attribute "price-level") (value ?value&:(neq ?value ?origin)) (quantity ?quantity))
	(not (suggestion (gift-id ?id) (attribute "price-level") (value ?value2)
		(quantity ?quantity2&:(or (> ?quantity2 ?quantity)(and (= ?quantity2 ?quantity) (< (str-compare ?value2 ?value) 0))))))
=>
	(modify ?d (price-level ?value))
)

; ; Rule of tuning "age-level"
(defrule tuning-age-level
	(declare (salience 2))
	?d <- (gift (ID ?id) (age-level ?origin))
	(suggestion (gift-id ?id) (attribute "age-level") (value ?value&:(neq ?value ?origin)) (quantity ?quantity))
	(not (suggestion (gift-id ?id) (attribute "age-level") (value ?value2)
		(quantity ?quantity2&:(or (> ?quantity2 ?quantity)(and (= ?quantity2 ?quantity) (< (str-compare ?value2 ?value) 0))))))
=>
	(modify ?d (age-level ?value))
)

; ; Rule of tuning "cat-fashion"
(defrule tuning-cat-fashion
	(declare (salience 2))
	?d <- (gift (ID ?id) (cat-fashion ?origin))
	(suggestion (gift-id ?id) (attribute "cat-fashion") (value ?value&:(neq ?value ?origin)) (quantity ?quantity))
	(not (suggestion (gift-id ?id) (attribute "cat-fashion") (value ?value2)
		(quantity ?quantity2&:(or (> ?quantity2 ?quantity)(and (= ?quantity2 ?quantity) (< (str-compare ?value2 ?value) 0))))))
=>
	(modify ?d (cat-fashion ?value))
)

; ; Rule of tuning "cat-music"
(defrule tuning-cat-music
	(declare (salience 2))
	?d <- (gift (ID ?id) (cat-music ?origin))
	(suggestion (gift-id ?id) (attribute "cat-music") (value ?value&:(neq ?value ?origin)) (quantity ?quantity))
	(not (suggestion (gift-id ?id) (attribute "cat-music") (value ?value2)
		(quantity ?quantity2&:(or (> ?quantity2 ?quantity)(and (= ?quantity2 ?quantity) (< (str-compare ?value2 ?value) 0))))))
=>
	(modify ?d (cat-music ?value))
)

; ; Rule of tuning "cat-book"
(defrule tuning-cat-book
	(declare (salience 2))
	?d <- (gift (ID ?id) (cat-book ?origin))
	(suggestion (gift-id ?id) (attribute "cat-book") (value ?value&:(neq ?value ?origin)) (quantity ?quantity))
	(not (suggestion (gift-id ?id) (attribute "cat-book") (value ?value2)
		(quantity ?quantity2&:(or (> ?quantity2 ?quantity)(and (= ?quantity2 ?quantity) (< (str-compare ?value2 ?value) 0))))))
=>
	(modify ?d (cat-book ?value))
)

; ; Rule of tuning "cat-games"
(defrule tuning-cat-games
	(declare (salience 2))
	?d <- (gift (ID ?id) (cat-games ?origin))
	(suggestion (gift-id ?id) (attribute "cat-games") (value ?value&:(neq ?value ?origin)) (quantity ?quantity))
	(not (suggestion (gift-id ?id) (attribute "cat-games") (value ?value2)
		(quantity ?quantity2&:(or (> ?quantity2 ?quantity)(and (= ?quantity2 ?quantity) (< (str-compare ?value2 ?value) 0))))))
=>
	(modify ?d (cat-games ?value))
)

; ; Rule of tuning "cat-movies"
(defrule tuning-cat-movies
	(declare (salience 2))
	?d <- (gift (ID ?id) (cat-movies ?origin))
	(suggestion (gift-id ?id) (attribute "cat-movies") (value ?value&:(neq ?value ?origin)) (quantity ?quantity))
	(not (suggestion (gift-id ?id) (attribute "cat-movies") (value ?value2)
		(quantity ?quantity2&:(or (> ?quantity2 ?quantity)(and (= ?quantity2 ?quantity) (< (str-compare ?value2 ?value) 0))))))
=>
	(modify ?d (cat-movies ?value))
)

; ; Rule of tuning "cat-gadgets"
(defrule tuning-cat-gadgets
	(declare (salience 2))
	?d <- (gift (ID ?id) (cat-gadgets ?origin))
	(suggestion (gift-id ?id) (attribute "cat-gadgets") (value ?value&:(neq ?value ?origin)) (quantity ?quantity))
	(not (suggestion (gift-id ?id) (attribute "cat-gadgets") (value ?value2)
		(quantity ?quantity2&:(or (> ?quantity2 ?quantity)(and (= ?quantity2 ?quantity) (< (str-compare ?value2 ?value) 0))))))
=>
	(modify ?d (cat-gadgets ?value))
)

; ; Rule of tuning "cat-sport"
(defrule tuning-cat-sport
	(declare (salience 2))
	?d <- (gift (ID ?id) (cat-sport ?origin))
	(suggestion (gift-id ?id) (attribute "cat-sport") (value ?value&:(neq ?value ?origin)) (quantity ?quantity))
	(not (suggestion (gift-id ?id) (attribute "cat-sport") (value ?value2)
		(quantity ?quantity2&:(or (> ?quantity2 ?quantity)(and (= ?quantity2 ?quantity) (< (str-compare ?value2 ?value) 0))))))
=>
	(modify ?d (cat-sport ?value))
)

; ; Rule of tuning "cat-cosmetics"
(defrule tuning-cat-cosmetics
	(declare (salience 2))
	?d <- (gift (ID ?id) (cat-cosmetics ?origin))
	(suggestion (gift-id ?id) (attribute "cat-cosmetics") (value ?value&:(neq ?value ?origin)) (quantity ?quantity))
	(not (suggestion (gift-id ?id) (attribute "cat-cosmetics") (value ?value2)
		(quantity ?quantity2&:(or (> ?quantity2 ?quantity)(and (= ?quantity2 ?quantity) (< (str-compare ?value2 ?value) 0))))))
=>
	(modify ?d (cat-cosmetics ?value))
)

; ; Rule of tuning "cat-toy"
(defrule tuning-cat-toy
	(declare (salience 2))
	?d <- (gift (ID ?id) (cat-toy ?origin))
	(suggestion (gift-id ?id) (attribute "cat-toy") (value ?value&:(neq ?value ?origin)) (quantity ?quantity))
	(not (suggestion (gift-id ?id) (attribute "cat-toy") (value ?value2)
		(quantity ?quantity2&:(or (> ?quantity2 ?quantity)(and (= ?quantity2 ?quantity) (< (str-compare ?value2 ?value) 0))))))
=>
	(modify ?d (cat-toy ?value))
)
