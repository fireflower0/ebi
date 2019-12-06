(uiop:define-package #:key-input/app
  (:use #:cl
        #:key-input/utils)
  (:export #:main))
(in-package #:key-input/app)

;; フォントファイルへのパス
(defparameter *font-file-path* "materials/fonts/ipaexg.ttf")

(defun create-string-texture (renderer font-file-path string
                              &key (r 0) (g 0) (b 0) (a 0))
  (let ((surface (sdl2-ttf:render-utf8-solid
                  (sdl2-ttf:open-font font-file-path 50)
                  string r g b a)))
    (values (sdl2:create-texture-from-surface renderer surface)
            (sdl2:surface-width  surface)
            (sdl2:surface-height surface))))

(defun main (&rest args)
  (with-window-renderer (window renderer)
    (let ((tex nil) (w 0) (h 0))
      (flet ((string-texture (renderer font string &key (r 0) (g 0) (b 0))
               (multiple-value-bind (texture width height)
                   (create-string-texture renderer font string :r r :g g :b b)
                 (setf tex texture w width h height))))
        (string-texture renderer *font-file-path* "こんにちは、世界！" :r 255 :g 255 :b 255)
        ;; イベントループ(この中にキー操作時の動作や各種イベントを記述していく)
        (sdl2:with-event-loop (:method :poll)
          ;; キーが押下されたときの処理
          (:keydown (:keysym keysym)
                    ;; keysymをスキャンコードの数値(scancode-value)に変換して、キー判定処理(scancode=)を行う
                    (if (sdl2:scancode= (sdl2:scancode-value keysym) :scancode-escape)
                        (sdl2:push-event :quit)  ; Escキーが押下された場合、quitイベントをキューに加える
                        (case (sdl2:scancode keysym)
                          (:scancode-up    (string-texture renderer *font-file-path* "上" :r 255 :g 255 :b 255))
                          (:scancode-down  (string-texture renderer *font-file-path* "下" :r 255 :g 255 :b 255))
                          (:scancode-left  (string-texture renderer *font-file-path* "左" :r 255 :g 255 :b 255))
                          (:scancode-right (string-texture renderer *font-file-path* "右" :r 255 :g 255 :b 255)))))
          ;; キーが離されたときの処理
          (:keyup ()
                  (string-texture renderer *font-file-path* "こんにちは、世界！" :r 255 :g 255 :b 255))
          ;; この中に描画処理など各種イベントを記述していく
          (:idle ()
                 ;; 作図操作(矩形、線、およびクリア)に使用する色を設定
                 (sdl2:set-render-draw-color renderer 0 0 0 255)
                 ;; 現在のレンダーターゲットを上記で設定した色で塗りつぶして消去
                 (sdl2:render-clear renderer)

                 ;; レンダリング処理
                 (let ((x-pos (- (/ *screen-width*  2) (floor w  2))) ; テキストの表示位置(X座標)計算
                       (y-pos (- (/ *screen-height* 2) (floor h 2)))) ; テキストの表示位置(Y座標)計算
                   (sdl2:render-copy renderer
                                     tex
                                     :dest-rect (sdl2:make-rect x-pos y-pos w h)))

                 ;; レンダリングの結果を画面に反映
                 (sdl2:render-present renderer))
          ;; 終了イベント
          (:quit () t))))))
