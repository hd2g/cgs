#lang racketscript

(require rackt
         racketscript/interop)

(define (app props ..)
  (<el "div"
    "ok"))

(render (<el app) "app")
