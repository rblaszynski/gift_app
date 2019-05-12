; ; Templates
; ; Template to represent "gift".
(deftemplate gift
  (slot ID (type NUMBER))
  (slot name (type STRING))
  (slot sex (type STRING))
  (slot price-level (type STRING))
  (slot age-level (type STRING))
  (slot cat-fashion (type STRING))
  (slot cat-music (type STRING))
  (slot cat-book (type STRING))
  (slot cat-games (type STRING))
  (slot cat-movies (type STRING))
  (slot cat-gadgets (type STRING))
  (slot cat-sport (type STRING))
  (slot cat-cosmetics (type STRING))
  (slot cat-toy (type STRING))
)

; ; Template to represent user's preference.
(deftemplate preference
  (slot sex (type STRING))
  (slot price-level (type STRING))
  (slot age-level (type STRING))
  (slot cat-fashion (type STRING))
  (slot cat-music (type STRING))
  (slot cat-book (type STRING))
  (slot cat-games (type STRING))
  (slot cat-movies (type STRING))
  (slot cat-gadgets (type STRING))
  (slot cat-sport (type STRING))
  (slot cat-cosmetics (type STRING))
  (slot cat-toy (type STRING))
)

; ; Template to represent user's suggestions (for fine-tuning gifts).
(deftemplate suggestion
  (slot gift-name (type STRING))
  (slot gift-id (type NUMBER))
  (slot attribute (type STRING))
  (slot value (type STRING))
  (slot quantity (type NUMBER))
)
