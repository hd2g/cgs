#lang typed/racket

(provide (all-defined-out))

(require typed/racket/date)
(define-type Date date)

(define-type Contents (Listof String))

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
