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

(define-type Service-Name String)

(struct account
  ([service-name : Service-Name])
  #:type-name Account
  #:transparent)

(define-type Accounts (Listof Account))

(define-type ID String)

(struct assigned-project
  ([id : ID])
  #:type-name Assigned-Project
  #:transparent)

(struct Author
  ([nickname : Nickname]
   [accounts : Accounts]
   [assigned-project : Assigned-Project]))

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
