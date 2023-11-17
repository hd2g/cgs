#lang typed/racket

(provide (all-defined-out))

(require racket/match)
(require tjson)
(require "./entity.rkt")

(: json->postit (-> Json Postit))
(define (json->postit obj)
  (error 'undefined))
