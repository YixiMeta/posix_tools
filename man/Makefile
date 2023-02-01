# This Makefile is amended from the Makefile shipped with 
# man-pages-posix-2017-a.tar.gz
# from "https://mirrors.edge.kernel.org/pub/linux/docs/man-pages/
# man-pages-posix/man-pages-posix-2017-a.tar.gz"
# Original Copyright Notice:
# The Institute of Electrical and Electronics Engineers and The Open Group,
# have given us permission to reprint portions of their documentation.

# In the following statement, the phrase ``this text'' refers to portions of
# the system documentation.

# Portions of this text are reprinted and reproduced in electronic form in
# the Linux man-pages project, from IEEE Std 1003.1-2017, Standard for
# Information Technology -- Portable Operating System Interface (POSIX), The
# Open Group Base Specifications Issue 7, 2018 Edition, Copyright (C) 2018
# by The Institute of Electrical and Electronics Engineers, Inc and The Open
# Group.  In the event of any discrepancy between these versions and the
# original IEEE and The Open Group Standard, the original IEEE and The Open
# Group Standard is the referee document.  The original Standard can be
# obtained online at http://www.opengroup.org/unix/online.html .

# This notice shall appear on any product containing this material.
DESTDIR=
prefix?=/usr/local
MANDIR=$(prefix)/share/man

all: remove install

uninstall remove:
	for i in man?/*; do \
		rm -f $(MANDIR)/"$$i" $(MANDIR)/"$$i".*; \
	done

install:
	for i in man?; do \
		install -d -m 755 $(DESTDIR)$(MANDIR)/"$$i" || exit $$?; \
		install -m 644 "$$i"/* $(DESTDIR)$(MANDIR)/"$$i" || exit $$?; \
	done
