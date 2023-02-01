#!/bin/sh
self="$(echo "$0" | sed -e 's,.*/,,')"
self_dir="$(echo "$0" | sed -e "s,/$self$,,")"
die() {
  printf '\033[1m%s\033[0m\n' "$1" >&2
  exit 1
}
# Detect OS
if [ -f '/etc/os-release' ]; then
  os_release='/etc/os-release'
elif [ -f '/usr/lib/os-release' ]; then
  os_release='/usr/lib/os-release'
fi
if [ -f "${os_release}" ]; then
  OS="$(grep '^ID_LIKE=.*' "${os_release}" || grep 'ID=.*' "${os_release}")"
  OS="${OS#*=}"
  OS="${OS#\"}"
  OS="${OS%\"}"
  OS="${OS#\'}"
  OS="${OS%\'}"
  OS="$(echo "$OS" | tr '[:upper:]' '[:lower:]')"
elif [ ! -f "${os_release}" ]; then
  OS="$(uname -s | tr '[:upper:]' '[:lower:]')"
fi
case "$OS" in
  'sunos'|'solaris')
    PATH=$(getconf PATH):PATH
    ;;
esac

# init variable
DESTDIR=
# Get options
while :; do
  case $1 in
    -D|--dest)
      if [ "$2" ]; then
        DESTDIR=$2
        shift
      else
        printf '\033[1mERROR: "%s" requires utility name to be ignored in the check.\033[0m\n' "$1" >&2
        exit 1
      fi
      ;;
    --dest=?*)
      DESTDIR=${1#*=};;
    --dest=)
      die 'ERROR: "--dest" requires utility name to be ignored in the check.';;
    --)
      shift
      break;;
    -?*)
      printf '\033[5m\033[1mWARN: Unknown option (ignored): %s\033[0m\n' "$1" >&2
      exit 128;;
    *)
      break
  esac

  shift
done

if [ -n "$DESTDIR" ]; then
  DESTDIR="$(echo "$DESTDIR" | sed "s,/$,,g")"
fi
# Add code to user bin 
for i in "${self_dir}"/bin/*; do
  cp "${self_dir}/bin/$i" "${DESTDIR}/usr/local/bin/" && chmod 755 "${DESTDIR}/usr/local/bin/$i"
done
# Add manpages to system
cd man && make install DESTDIR="${DESTDIR}"
cd ..