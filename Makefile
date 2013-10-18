IDIR = include
CC = gcc
CFLAGS = -I$(IDIR) -g -O0

BINDIR = bin
ODIR = src
LDIR = ../lib

LIBS = -lm

_DEPS = opts.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = parser.o opts.o 
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))


$(ODIR)/%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

parser: $(OBJ)
	$(CC) -o $(BINDIR)/$@ $^ $(CFLAGS) $(LIBS)

.PHONY: clean

clean:
	rm -f $(BINDIR)/* $(ODIR)/*.o *~ core $(INCDIR)/*~
