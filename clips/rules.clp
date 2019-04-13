; ; Rules for matching gifts with given preference
; ; Salience set to 1 so this rule will be fired at the end.
; ; (Other rules have salience = 2)
(defrule gifts-matching
	(declare (salience 1))
	(gift (ID ?ID) (name ?name) (sex ?sex) (age-level ?age) (price-level ?price))
	(preference (sex "?"|?sex)
			(age-level "?"|?age)
			(price-level "?"|?price))
=>
	(printout t ?ID "," ?name "," ?sex "," ?age "," ?price ":")
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
