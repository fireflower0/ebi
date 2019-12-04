(uiop:define-package #:2drendering/app
  (:use #:cl
        #:2drendering/utils)
  (:export #:main))
(in-package #:2drendering/app)

;; 線を描画する
(defun line-render (renderer)
  (sdl2:set-render-draw-color renderer 255 0 0 255)
  (sdl2:render-draw-line renderer 150 50 400 50))

;; 複数の繋がった線を描画する
(defun lines-render (renderer)
  (sdl2:with-points ((a 160 160)
                     (b 300 180)
                     (c 400 160))
    (sdl2:set-render-draw-color renderer 0 0 255 255)
    (multiple-value-bind (points num) (sdl2:points* a b c)
      (sdl2:render-draw-lines renderer points num))))

;; ランダムに複数の点を描画する
(defun points-render (renderer)
  (sdl2:with-points ((a (random 800) (random 800))
                     (b (random 800) (random 800))
                     (c (random 800) (random 800)))
    (sdl2:set-render-draw-color renderer 0 255 0 255)
    (multiple-value-bind (points num) (sdl2:points* a b c)
      (sdl2:render-draw-points renderer points num))))

;; 長方形を描画する
(defun rect-render (renderer)
  (sdl2:set-render-draw-color renderer 0 255 0 255)
  (sdl2:render-draw-rect renderer (sdl2:make-rect 300 300 100 100)))

;; 複数の長方形を描画
(defun rects-render (renderer)
  (sdl2:set-render-draw-color renderer 255 0 0 255)
  (multiple-value-bind (rects num)
      (apply #'sdl2:rects*
             (loop :for x :upto 5
                   :for y :upto 5
                   :collect (sdl2:make-rect (+ 400 (* x 10)) (+ 200 (* y 10)) 8 8)))
    (sdl2:render-draw-rects renderer rects num)))

;; 塗りつぶした長方形を描画する
(defun fill-rect-render (renderer)
  (sdl2:set-render-draw-color renderer 255 0 255 255)
  (sdl2:render-fill-rect renderer (sdl2:make-rect 445 400 35 35)))

;; 複数の塗りつぶした長方形を描画する
(defun fill-rects-render (renderer)
  (multiple-value-bind (rects num)
      (apply #'sdl2:rects*
             (loop :for x :upto 5
                   :collect (sdl2:make-rect (+ 500 (* x 10)) 400 8 8)))
    (sdl2:set-render-draw-color renderer 255 255 0 255)
    (sdl2:render-fill-rects renderer rects num)))

(defun main (&rest args)
  (with-window-renderer (window renderer)
    ;; イベントループ(この中にキー操作時の動作や各種イベントを記述していく)
    (sdl2:with-event-loop (:method :poll)
      ;; キーが押下されたときの処理
      (:keydown (:keysym keysym)
                ;; keysymをスキャンコードの数値(scancode-value)に変換して、キー判定処理(scancode=)を行う
                (if (sdl2:scancode= (sdl2:scancode-value keysym) :scancode-escape)
                    (sdl2:push-event :quit))) ; Escキーが押下された場合、quitイベントをキューに加える
      ;; この中に描画処理など各種イベントを記述していく
      (:idle ()
             (sdl2:set-render-draw-color renderer 0 0 0 255) ; 作図操作(矩形、線、およびクリア)に使用する色を設定
             (sdl2:render-clear renderer)                    ; 現在のレンダーターゲットを上記で設定した色で塗りつぶして消去

             ;; レンダリング処理
             (line-render renderer)       ; 線を描画する
             (lines-render renderer)      ; 複数の繋がった線を描画する
             (points-render renderer)     ; ランダムに複数の点を描画する
             (rect-render renderer)       ; 長方形を描画する
             (rects-render renderer)      ; 複数の長方形を描画
             (fill-rect-render renderer)  ; 塗りつぶした長方形を描画する
             (fill-rects-render renderer) ; 複数の塗りつぶした長方形を描画する
             
             (sdl2:render-present renderer))  ; レンダリングの結果を画面に反映
      ;; 終了イベント
      (:quit () t))))
