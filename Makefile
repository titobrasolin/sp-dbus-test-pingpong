TARGETS = dping dpong

DBUS_INCS=`pkg-config dbus-glib-1 --cflags` 
DBUS_LIBS=`pkg-config dbus-glib-1 --libs`

all: $(TARGETS)

clean:
	$(RM) *.o *~

distclean: clean
	$(RM) $(TARGETS)

dping: dping.c utils.c
	gcc -W -Wall -O2 -s $(DBUS_INCS) -lrt -o $@ $^ $(DBUS_LIBS)

dpong: dpong.c utils.c
	gcc -W -Wall -O2 -s $(DBUS_INCS) -lrt -o $@ $^ $(DBUS_LIBS)

install:
	mkdir -p $(DESTDIR)/usr/bin
	install dping $(DESTDIR)/usr/bin/
	install dpong $(DESTDIR)/usr/bin/
	mkdir -p $(DESTDIR)/usr/share/man/man1
	install -m 644 dping.1 $(DESTDIR)/usr/share/man/man1/
	install -m 644 dpong.1 $(DESTDIR)/usr/share/man/man1/
