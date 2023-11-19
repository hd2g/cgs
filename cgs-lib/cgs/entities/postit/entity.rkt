#lang typed/racket

(provide (all-defined-out))

(require (only-in racket/match match))

(require typed/racket/date)
(define-type Date date)

(define-type Contents (Listof String))

(: contents? (-> Any Boolean : Contents))
(define (contents? value)
  (match value
    [(list (? string?)) #t]))

(define-type Nickname String)

(: nickname? (-> Any Boolean : Nickname))
(define nickname? string?)

(define-type Service-Name String)

(struct account
  ([service-name : Service-Name])
  #:type-name Account
  #:transparent)

(define-type Accounts (Listof Account))

(: accounts? (-> Any Boolean : Accounts))
(define (accounts? value)
  (match value
    [(list (? account?)) #t]))

(define-type ID String)

(: id? (-> Any Boolean : ID))
(define id? string?)

(struct author
  ([id : ID]
   [nickname : Nickname]
   [accounts : Accounts])
  #:type-name Author
  #:transparent)

(define-type Name String)

(struct tag
  ([name : Name])
  #:type-name Tag
  #:transparent)

(define-type Tags (Listof Tag))

(struct postit
  ([contents : Contents]
   [timestamp : Date]
   [author : Author]
   [tags : Tags])
  #:type-name Postit
  #:transparent)
