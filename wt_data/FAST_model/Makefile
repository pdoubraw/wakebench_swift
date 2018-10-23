ifeq ($(OS),Windows_NT)
	RM=del /F /Q 
	FAST=FAST_v7.02.exe
	NULL=nul
else
	RM=rm
	FAST=wine FAST_v7.02.exe
	NULL=/dev/null
endif

all:
	$(FAST) SNLV27.fst

clean:
	@$(RM) *.out  2>$(NULL)
	@$(RM) *.outb 2>$(NULL)
	@$(RM) *.opt 2>$(NULL)
	@$(RM) *.elm 2>$(NULL)
	@$(RM) *.fsm 2>$(NULL)
