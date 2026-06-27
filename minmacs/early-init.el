;;; early-init.el -*- lexical-binding t; -*-

;; Speed up startup by delaying GC.
(setq gc-cons-threshold most-positive-fixnum 
      gc-cons-percentage 0.6)

;; Disable package.el auto-loading before init.el
(setq package-enable-at-startup nil)
(setq site-run-file nil)

;; UI chrome off early
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Avoid frame resizing / flicker
(setq frame-inhibit-implied-resize t)
