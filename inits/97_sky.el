;;https://qiita.com/zk_phi/items/11a419911db861b9211e

(require 'sky-color-clock)


(sky-color-clock-initialize 35)
(sky-color-clock-initialize-openweathermap-client "4596860df73bb1e4d0ae3e939dc53045" 1850144)
(setq sky-color-clock-format "%d %H:%M")
(push '(:eval (sky-color-clock)) (default-value 'mode-line-format))
(sky-color-clock-initialize-openweathermap-client "4596860df73bb1e4d0ae3e939dc53045" 1850144)

;; (sky-color-clock-initialize-openweathermap-client "API-key" 1850144)


;; (push '(:eval (sky-color-clock)) (default-value 'mode-line-format))
;; (setq sky-color-clock-format "%d %H:%M")
;; (setq sky-color-clock-enable-emoji-icon t)
;; (setq sky-color-clock-enable-temperature-indicator t)
