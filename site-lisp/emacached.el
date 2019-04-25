

(princ-list "Input string is: " (read-string "Input some string: "))


44A1214 / 44A1215の空いてるサーバ上で


DOMAIN  CPU USED_MEM(GB) MAX_MEM(GB)    DISK(GB
44A1214 lvs2005
AVAIL        4     21.467     21.467    1360

44A1215 lvs2012
AVAIL       18     33.142     33.142    1698


  kohei
  uchiyama
  hiyama
  endo taichi



  
;; #!/usr/bin/env bash
;; IFS=$' \t\n\r' # ネットワークを介すので\nに加えて\rも区切りにする

;; if [[ -z $PIPE ]]; then
;;   # 最初に実行したときだけここに来る

;;   # 一時ファイルとして名前付きパイプを作成
;;   export PIPE="$(mktemp -u)"; mkfifo -m 600 "$PIPE"
;;   trap "rm -f '$PIPE'" EXIT # スクリプトの終了時に削除

;;   socat tcp-listen:25252,fork system:"$0" & # サーバーを起動
;;   #                                       ^-- socatで止まらないようにバックグラウンドで起動

;;   COUNT=0
;;   # メインループ
;;   # 各行の命令を受け取り、その結果をパイプを介して返す
;;   while true; do cat "$PIPE"; done | while read -ra cmd; do
;;     recv="$(echo -n "${cmd[0]}" | base64 -d)"
;;     case ${cmd[1]} in
;;     incr)
;;       echo $[++COUNT] >"$recv";;
;;     esac
;;   done
;; else
;;   # 各アクセス毎に実行される場所

;;   # 一時ファイルとして名前付きパイプを作成
;;   recv="$(mktemp -u)"; mkfifo -m 600 "$recv"
;;   # 名前付きパイプと命令を送信
;;   # （base64でエンコードするのは空白を含むかもしれないから）
;;   echo $(echo -n "$recv" | base64 -w0) incr >"$PIPE"
;;   # 結果を受け取る
;;   cat "$recv"
;;   rm -f "$recv" # 名前付きパイプを削除
;; fi
