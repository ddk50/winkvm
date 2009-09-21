
LD		= gcc
CC 		= gcc
OBJS 	= user.o
CFLAGS	= -mno-cygwin -mwindows
LDFLAGS	= -mno-cygwin -mwindows
EXENAME	= user.exe

$(EXENAME): $(OBJS)
	$(LD) $(LDFLAGS) $(OBJS) -o $(EXENAME)

.c.o:
	$(CC) $(CFLAGS) -c $<
