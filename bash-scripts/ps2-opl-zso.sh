for f in (import folder)/*.iso; do "(path to)/opl-ziso.py" -c 2 "$f" "(path to)/OpenPS2Loader/DVD/$(basename "$f" .iso).zso"; rm "$f"; done
