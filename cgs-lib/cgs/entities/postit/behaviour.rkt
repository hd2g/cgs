#lang typed/racket

(provide (all-defined-out))

(require (only-in racket/match match))
(require typed/json)

(require (only-in typed/srfi/19 string->date))

(require "./entity.rkt")

(: json->postit-contents (-> JSExpr Contents))
(define (json->postit-contents obj)
  (match obj
    [(hash-table ('contents value))
     (if (contents? value)
         value
         (error 'parameter-doesnt-exists))]))

(: json->postit-timestamp (-> JSExpr Date))
(define (json->postit-timestamp obj)
  (match obj
    [(hash-table ('timestamp value))
     (if (string? value)
         (cast (string->date value "~Y-~m-~d") Date)
         (error 'invalid-postitcytimestamp))]))

(: json->postit-author (-> JSExpr Author))
(define (json->postit-author obj)
  (match obj
    [(hash-table ('id id) ('nickname nickname) ('accounts accounts))
     (if (and (id? id) (nickname? nickname) (accounts? accounts))
         (author id nickname accounts)
         (error 'invalid-propety))]))

(: json->postit (-> JSExpr Postit))
(define (json->postit obj)
  (error 'undefined))
